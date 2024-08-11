part of 'sign_up_bloc.dart';

sealed class SignUpEvent {}

class CreateAccountWithEmailAndPassword extends SignUpEvent{
  late UserModel userModel;
  CreateAccountWithEmailAndPassword(){
    userModel = UserModel();
  }
}

class CreateAccountWithGoogle extends SignUpEvent{}
