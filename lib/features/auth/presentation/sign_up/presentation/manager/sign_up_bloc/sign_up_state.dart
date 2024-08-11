part of 'sign_up_bloc.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpFailure extends SignUpState{
  final String errorMessage;
  SignUpFailure(this.errorMessage);
}

final class SignUpWithEmailAndPasswordFailure extends SignUpState{
  final String errorMessage;
  SignUpWithEmailAndPasswordFailure(this.errorMessage);
}

final class SignUpWithGoogleFailure extends SignUpState{
  final String errorMessage;
  SignUpWithGoogleFailure(this.errorMessage);
}

final class SignUpWithEmailAndPasswordLoading extends SignUpState{}

final class SignUpWithGoogleLoading extends SignUpState{}


final class SignUpWithGoogleSuccess extends SignUpState{}

final class SignUpWithEmailAndPasswordSuccess extends SignUpState{}
