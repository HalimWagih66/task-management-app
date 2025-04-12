import 'package:bloc/bloc.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/sign_out_cubit/sign_out_state.dart';

import '../../../data/home_layout_repo.dart';


class SignOutCubit extends Cubit<SignOutState> {
  HomeLayoutRepo homeLayoutRepo;

  SignOutCubit({required this.homeLayoutRepo}) : super(SignOutInitial());

  Future<void>signOut()async{
    var result = await homeLayoutRepo.signOut();
    result.fold((failure) {
      emit(SignOutFailure(failure.message));
    }, (success) {
      emit(SignOutSuccess());
    },);
  }

}
