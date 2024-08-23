import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management_app/core/services/firebase/services/auth_services.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/models/user_model.dart';
import '../../../core/services/firebase/services/database_services.dart';
import '../../../core/utils/functions/custom_typedef.dart';
import 'home_layout_repo.dart';
class HomeLayoutRepoImpl implements HomeLayoutRepo{
  HomeLayoutRepoImpl({required this.databaseServices,required this.authServices});
  DatabaseServices databaseServices;
  AuthServices authServices;
  @override
  Future<Either<Failure, UserModel>> fetchUserModel({required String uid}) async{
    try {
      UserModel? userModel = await databaseServices.getUser(uid: uid, collectionName: "users");
      if(userModel == null){
        UserModel user = UserModel(
          name: FirebaseAuth.instance.currentUser!.displayName,
          id: FirebaseAuth.instance.currentUser!.email,
          email: FirebaseAuth.instance.currentUser!.email,
          imageUrl: FirebaseAuth.instance.currentUser!.photoURL,
        );
        await databaseServices.createUser(collectionName: "users",userJson: user.toJson());
        userModel = user;
      }
      return right(userModel);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    } catch (e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure,bool>> signOut() async{
    try {
      await authServices.signOut();
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    } catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  void listenIngUserModel({required String collection,required String uid, required EventFunction executeFunction}) {
    FirebaseFirestore.instance.collection(collection).doc(uid).snapshots().listen((event) {
      executeFunction(event.data());
    },);
  }

}