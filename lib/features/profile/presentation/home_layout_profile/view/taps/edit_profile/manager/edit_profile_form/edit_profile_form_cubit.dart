import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/profile/data/profile_repo.dart';
part  'edit_profile_form_state.dart';


class EditProfileFormCubit extends Cubit<EditProfileFormState> {
  ProfileRepo profileRepo;
  EditProfileFormCubit({required this.profileRepo}) : super(EditProfileFormInitial());

  Future<void> editFieldInUserInDatabase({required Map<String, dynamic> newData,required uid})async{
    emit(EditProfileFormLoading());
    var result = await profileRepo.editFieldInUserInDatabase(uid: uid, collectionName: "users", newData: newData);
    result.fold((failure) {
      emit(EditProfileFormFailure(failure.message));
    }, (success) {
      emit(EditProfileFormSuccess(editType: "name"));
    },);
  }

  Future<void> changePassword({required String newPassword})async{
    emit(EditProfileFormLoading());
    var result = await profileRepo.changePassword(newPassword: newPassword);
    result.fold((failure) {
      emit(EditProfileFormFailure(failure.message));
    }, (success) {
      emit(EditProfileFormSuccess(editType: "password"));
    },);
  }
}
