part of 'sign_up_bloc.dart';

sealed class SignUpEvent {}

class SignUpWithEmailAndPassword extends SignUpEvent{}

class SignUpWithGoogle extends SignUpEvent{}
