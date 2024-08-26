import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_state.dart';
import '../../../../../core/models/user_model.dart';
import '../../../data/home_layout_repo.dart';

class UserModelCubit extends Cubit<UserModelState>{
  HomeLayoutRepo homeLayoutRepo;
  UserModelCubit({required this.homeLayoutRepo}):super(UserModelInitial());

  UserModel? userModel;



  Future<void> fetchUserModel(String uid)async{
    emit(UserModelLoading());
    var result = await homeLayoutRepo.fetchUserModel(uid: uid);
    result.fold((failure) {
      emit(UserModelFailure(errorMessage: failure.message));
    }, (userModel) {
      this.userModel = userModel;
      emit(UserModelSuccess());
    },);
  }
  void listenIngUserModelFromDatabase(){
    homeLayoutRepo.listenIngUserModelInDatabase(uid: userModel!.id!, executeFunction: (newData){
      userModel = newData;
    });
  }
}