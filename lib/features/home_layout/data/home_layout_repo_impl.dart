import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/errors/exceptions/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/models/user_model.dart';
import '../../../core/services/auth/services/auth_services.dart';
import '../../../core/services/database/database_services/database_services.dart';
import '../../../core/utils/functions/custom_typedef.dart';
import 'home_layout_repo.dart';
class HomeLayoutRepoImpl implements HomeLayoutRepo{
  HomeLayoutRepoImpl({required this.databaseServices,required this.authServices});
  DatabaseServices databaseServices;
  AuthServices authServices;
  @override
  Future<Either<Failure, UserModel>> fetchUserModel({required String uid}) async{
    try {
      UserModel? userModel = await databaseServices.usersDatabase.getUserFromDatabase(uid: uid);
      if(userModel == null){
        UserModel user = UserModel(
          name: FirebaseAuth.instance.currentUser!.displayName,
          id: FirebaseAuth.instance.currentUser!.email,
          email: FirebaseAuth.instance.currentUser!.email,
          imageUrl: FirebaseAuth.instance.currentUser!.photoURL,
        );
        await databaseServices.usersDatabase.createUserInDatabase(userModel: user);
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
  void listenIngUserModelInDatabase({required String uid, required EventFunction executeFunction}) {
    databaseServices.usersDatabase.listenIngUserModelInDatabase(uid: uid, executeFunction: executeFunction);
  }

}