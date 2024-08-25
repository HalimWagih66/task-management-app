import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management_app/core/errors/exceptions.dart';
import 'package:task_management_app/core/errors/failures.dart';
import 'package:task_management_app/core/models/user_model.dart';
import 'package:task_management_app/core/services/firebase/services/auth_services.dart';
import 'package:task_management_app/core/utils/constant/firebase/firebase_storage_constant.dart';
import 'package:task_management_app/core/utils/constant/sentence/sentence.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo.dart';
import '../../../../core/services/firebase/services/database_services.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.databaseServices,required this.authServices});
  DatabaseServices databaseServices;
  AuthServices authServices;

  @override
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword({required UserModel userModel, required File file, required String password}) async{
    try {
      var uid = await authServices.createUserWithEmailAndPassword(emailAddress: userModel.email!, password: password);
      userModel.id = uid;
      await authServices.sendEmailVerification();
      String imageUrl = await databaseServices.uploadFileInDatabase(file:file,pathTheFile: FirebaseStorageConstant.getPathTheImage(email: userModel.email!, folderName: FirebaseStorageConstant.person),fileName: FirebaseStorageConstant.userImageFileName);
      userModel.imageUrl = imageUrl;
      await databaseServices.createUser(userJson: userModel.toJson(),collectionName: "users");
      return right(userModel);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUpByGoogle()async {
    try {
      var user = await authServices.signInWithGoogle();
      if(user != null){
        UserModel userModel = UserModel(
            name: user.name,
            id: user.email,
            email: user.email,
            imageUrl: user.imageUrl
        );
        await databaseServices.createUser(userJson: userModel.toJson(), collectionName: "users");
        return right(userModel);
      }else{
        return left(UserFailure("Registration is not complete."));
      }
    } on Exception{
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }
  @override
  Future<Either<Failure, UserModel>> signInByGoogle()async {
    try {
      var user = await authServices.signInWithGoogle();
      if(user == null) {
        return left(UserFailure("Registration is not complete."));
      }
      return right(user);
    } on CustomException catch(e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }
  @override
  Future<Either<Failure, String?>> loginWithEmailAndPassword({required String emailAddress, required String password}) async{
    try {
      var uid = await authServices.loginWithEmailAndPassword(emailAddress: emailAddress, password: password);
      if(FirebaseAuth.instance.currentUser!.emailVerified == false){
        return left(ServerFailure("Activate your account dear"));
      }
      return right(uid);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword(String email) async{
    try{
      await authServices.resetPassword(email);
      return right(true);
    }on CustomException catch(e){
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

}