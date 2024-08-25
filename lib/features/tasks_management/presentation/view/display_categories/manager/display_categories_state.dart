part of 'display_categories_cubit.dart';

@immutable
sealed class DisplayCategoriesState {}

final class DisplayCategoriesInitial extends DisplayCategoriesState {}

final class DisplayCategoriesFailure extends DisplayCategoriesState {
  final String errorMessage;
  DisplayCategoriesFailure({required this.errorMessage});
}

final class DisplayCategoriesSuccess extends DisplayCategoriesState {}

final class DisplayCategoriesLoading extends DisplayCategoriesState {}

final class DisplayCategoriesIsEmpty extends DisplayCategoriesState {
  final String title;
  DisplayCategoriesIsEmpty({required this.title});
}

final class CategoryImageSuccess extends DisplayCategoriesState {
  final File file;
  CategoryImageSuccess({required this.file});
}

final class AddCategorySuccess extends DisplayCategoriesState {}

final class AddCategoryLoading extends DisplayCategoriesState {}

final class AddCategoryFailure extends DisplayCategoriesState {
  final String errorMessage;
  AddCategoryFailure({required this.errorMessage});
}

final class EditCategorySuccess extends DisplayCategoriesState {}

final class EditCategoryLoading extends DisplayCategoriesState {}

final class EditCategoryFailure extends DisplayCategoriesState {
  final String errorMessage;
  EditCategoryFailure({required this.errorMessage});
}

final class CategoryImageIsNotValid extends DisplayCategoriesState {}


final class DeleteCategorySuccess extends DisplayCategoriesState {}
