import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_state.dart';
import '../../../../../core/models/user_model.dart';
import '../../../data/home_layout_repo.dart';

class UserModelCubit extends Cubit<UserModelState>{
  HomeLayoutRepo homeLayoutRepo;
  UserModelCubit({required this.homeLayoutRepo}):super(UserModelInitial()){
    pageController = PageController();
  }

  late PageController pageController;
  UserModel? userModel;



  Future<void> fetchUserModel()async{
    emit(UserModelLoading());
    var result = await homeLayoutRepo.fetchUserModel(uid: FirebaseAuth.instance.currentUser!.email!);
    result.fold((failure) {
      emit(UserModelFailure(errorMessage: failure.message));
    }, (userModel) {
      this.userModel = userModel;
      emit(UserModelSuccess());
    },);
  }
}