part of 'log_in_bloc.dart';

@immutable
sealed class LogInEvent {}

class LogInByEmailAndPassword extends LogInEvent{}

