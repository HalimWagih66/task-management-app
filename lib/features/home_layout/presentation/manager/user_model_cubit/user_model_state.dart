
sealed class UserModelState {}

class UserModelInitial extends UserModelState{}

class UserModelSuccess extends UserModelState{}
class UserModelFailure extends UserModelState{
  String errorMessage;
  UserModelFailure({required this.errorMessage});
}
class UserModelLoading extends UserModelState{}

class RebuildImagePicker extends UserModelState{}