sealed class ControlCategoriesState {}

final class DisplayCategoriesInitial extends ControlCategoriesState {}

final class DisplayCategoriesFailure extends ControlCategoriesState {
  final String errorMessage;
  DisplayCategoriesFailure({required this.errorMessage});
}

final class DisplayCategoriesSuccess extends ControlCategoriesState {}

final class DisplayCategoriesLoading extends ControlCategoriesState {}

final class DisplayCategoriesIsEmpty extends ControlCategoriesState {
  final String title;
  DisplayCategoriesIsEmpty({required this.title});
}



final class AddCategorySuccess extends ControlCategoriesState {}

final class AddCategoryLoading extends ControlCategoriesState {}

final class AddCategoryFailure extends ControlCategoriesState {
  final String errorMessage;
  AddCategoryFailure({required this.errorMessage});
}

final class EditCategorySuccess extends ControlCategoriesState {
  final String? editType;
  EditCategorySuccess({this.editType});
}

final class EditCategoryLoading extends ControlCategoriesState {
  final String? editType;
  EditCategoryLoading({this.editType});
}

final class EditCategoryFailure extends ControlCategoriesState {
  final String errorMessage;
  EditCategoryFailure({required this.errorMessage});
}





final class DeleteCategorySuccess extends ControlCategoriesState {}

final class DeleteCategoryLoading extends ControlCategoriesState {}

final class DeleteCategoryFailure extends ControlCategoriesState {
  final String errorMessage;
  DeleteCategoryFailure({required this.errorMessage});
}
