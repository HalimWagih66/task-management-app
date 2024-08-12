part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}
class ResetPassword extends ResetPasswordEvent{
  late final String email;
  ResetPassword(this.email);
}