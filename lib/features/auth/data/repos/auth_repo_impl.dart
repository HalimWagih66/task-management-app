import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/exceptions.dart';
import 'package:task_management_app/core/errors/failures.dart';
import 'package:task_management_app/core/models/user_model.dart';
import 'package:task_management_app/core/services/firebase/firebase_auth.dart';
import 'package:task_management_app/core/utils/functions/path/edit_path_file.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo.dart';
import '../../../../core/services/firebase/database_services.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.databaseServices,required this.firebaseAuthServices});
  DatabaseServices databaseServices;
  FirebaseAuthServices firebaseAuthServices;

  @override
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword({required UserModel userModel, required File file, required String password}) async{
    try {
      var userFirebaseAuth = await firebaseAuthServices.createUserWithEmailAndPassword(emailAddress: userModel.email!, password: password);
      userModel.id = userFirebaseAuth!.uid;
      await firebaseAuthServices.verifyEmail();
      String imageUrl = await databaseServices.uploadFileInDatabase(file:file,pathTheFile: "${EditPath.nameEmail(userModel.email!)}/images/",fileName: "person_image");
      userModel.imageUrl = imageUrl;
      await databaseServices.createUser(userJson: userModel.toJson(),collectionName: "users");
      return right(userModel);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure("Something went wrong, please try again."));
    }
  }
}