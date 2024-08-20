import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/models/user_model.dart';
import '../../../core/services/firebase/services/database_services.dart';
import 'home_layout_repo.dart';

class HomeLayoutRepoImpl implements HomeLayoutRepo{
  HomeLayoutRepoImpl({required this.databaseServices});
  DatabaseServices databaseServices;

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
      throw left(ServerFailure(e.errorMessage));
    } catch (e){
      throw left(ServerFailure(e.toString()));
    }
  }

}