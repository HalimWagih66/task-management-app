part of 'sign_up_bloc.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpFailure extends SignUpState{
  final String errorMessage;
  SignUpFailure(this.errorMessage);
}

final class SignUpLoading extends SignUpState{}

final class SignUpSuccess extends SignUpState{

}