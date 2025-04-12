import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepo authRepo;
  ResetPasswordBloc({required this.authRepo}) : super(ResetPasswordInitial()) {
    on<ResetPasswordEvent>((event, emit) async{
      if(event is ResetPassword){
        emit(ResetPasswordLoading());
        var result = await authRepo.resetPassword(event.email);
        result.fold((failure) {
          emit(ResetPasswordFailure(failure.message));
        }, (_) {
          emit(ResetPasswordSuccess());
        },);
      }
    });
  }
}
