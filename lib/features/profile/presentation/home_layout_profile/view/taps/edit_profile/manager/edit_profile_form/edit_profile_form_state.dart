part of 'edit_profile_form_cubit.dart';


sealed class EditProfileFormState {}

final class EditProfileFormInitial extends EditProfileFormState {}

final class EditProfileFormLoading extends EditProfileFormState {}

final class EditProfileFormFailure extends EditProfileFormState {
  String errorMessage;
  EditProfileFormFailure(this.errorMessage);
}

final class EditProfileFormSuccess extends EditProfileFormState {
  String editType;
  EditProfileFormSuccess({required this.editType});
}
