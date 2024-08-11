import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:task_management_app/core/models/user_model.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo authRepo;
  late UserModel userModel;
  String? password;
  File? pickedImage;
  SignUpBloc({required this.authRepo}) : super(SignUpInitial()) {
    userModel = UserModel();
    on<SignUpEvent>((event, emit) async {
      if(event is CreateAccountWithEmailAndPassword){
        emit(SignUpLoading());
        var result = await authRepo.createUserWithEmailAndPassword(userModel: userModel, file: pickedImage!, password: password!);
        result.fold((failure) {
          emit(SignUpFailure(failure.message));
        }, (userModel) {
          emit(SignUpSuccess());
          this.userModel = userModel;
        },);
      }
    });
  }
}
