import '../../../../../features/tasks_management/data/models/category_model.dart';
import '../../../../utils/functions/custom_typedef.dart';

abstract class CategoriesDatabase{
  Future<List<CategoryModel>> fetchCategories({required String uid});

  void listenIngCollectionCategories({required String uid,required EventFunction executeFunction});

  Future<void>deleteCategoryFromDatabase({required String categoryId,required String uid});

  Future<void> editCategoryFromDatabase({required String categoryId, required String uid,required Map<String,dynamic> newData});

  Future<String?> addCategoryInDatabase({required String uid,required CategoryModel categoryModel});
}