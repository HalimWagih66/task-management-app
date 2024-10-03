
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


// final class FetchTasksInCategoryFailure extends ControlCategoriesState {
//   final String errorMessage;
//   FetchTasksInCategoryFailure({required this.errorMessage});
// }
//
//
// final class FetchTasksInCategorySuccess extends ControlCategoriesState {
//   List<TaskModel> tasks;
//   FetchTasksInCategorySuccess({required this.tasks});
// }
//
//
//
// final class FetchTasksInCategoryLoading extends ControlCategoriesState {}


// final class FetchTasksUsingFilterInCategoryFailure extends ControlCategoriesState {
//   final String errorMessage;
//   FetchTasksUsingFilterInCategoryFailure({required this.errorMessage});
// }
//
//
// final class FetchTasksUsingFilterInCategorySuccess extends ControlCategoriesState {
//   List<TaskModel> tasks;
//   FetchTasksUsingFilterInCategorySuccess({required this.tasks});
// }
//
//
//
// final class FetchTasksUsingFilterInCategoryLoading extends ControlCategoriesState {}

