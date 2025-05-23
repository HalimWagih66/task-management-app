import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failures.dart';
import 'package:task_management_app/core/utils/constant/sentence/sentence.dart';
import 'package:task_management_app/features/profile/data/repos/profile_repo.dart';
import '../../../../core/errors/exceptions/exceptions.dart';
import '../../../../core/services/auth/services/auth_services.dart';
import '../../../../core/services/database/database_services/database_services.dart';

class ProfileRepoImpl implements ProfileRepo{
  DatabaseServices databaseServices;
  AuthServices authServices;
  ProfileRepoImpl({required this.databaseServices,required this.authServices});
  @override
  Future<Either<Failure, bool>> editFieldInUserInDatabase({required String uid,required Map<String, dynamic> newData})async {
    try {
      await databaseServices.usersDatabase.modifyAFieldInAUserInADatabase(uid: uid, newData: newData);
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    } catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword({required String newPassword}) async{
    try {
      await authServices.changePassword(newPassword: newPassword);
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    } catch(e){
      return left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, String>> uploadFileInDatabase({required String pathTheFile, required File file, required String fileName})async {
    try {
      String imageUrl = await databaseServices.storageDatabase.uploadFileInDatabase(pathTheFile: pathTheFile, file: file, fileName: fileName);
      return right(imageUrl);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

}