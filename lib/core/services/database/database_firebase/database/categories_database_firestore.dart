import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/core/services/database/database_firebase/database/users_database_firestore.dart';
import 'package:task_management_app/core/services/database/database_services/database_interface/categories_database.dart';
import 'package:task_management_app/core/utils/functions/custom_typedef.dart';
import 'package:task_management_app/features/tasks_management/data/models/category_model.dart';

class CategoriesDatabaseFirestore implements CategoriesDatabase{
  CollectionReference<CategoryModel> getCategoriesCollection({required String uid}) {
    return UsersDatabaseFirestore().getUsersCollection().doc(uid).collection(CategoryModel.collectionName).withConverter(
      fromFirestore: (snapshot, options) => CategoryModel.fromFireStore(snapshot.data()),
      toFirestore: (value, options) => value.toFireStore(),
    );
  }
  @override
  Future<String?> addCategoryInDatabase({required String uid, required CategoryModel categoryModel})async {
    var document =  getCategoriesCollection(uid: uid).doc();
    categoryModel.categoryId = document.id;
    await document.set(categoryModel);
    return categoryModel.categoryId;
  }
  @override
  Future<void> deleteCategoryFromDatabase({required String categoryId, required String uid}) async {
    await getCategoriesCollection(uid: uid).doc(categoryId).delete();

  }

  @override
  Future<void> editCategoryFromDatabase({required String categoryId, required String uid, required Map<String, dynamic> newData}) async{
    await getCategoriesCollection(uid: uid).doc(categoryId).update(newData);
  }

  @override
  Future<List<CategoryModel>> fetchCategories({required String uid})async {
    var data = await getCategoriesCollection(uid: uid).get();
    List<CategoryModel> categories = [];
    data.docs.map((e) {
      categories.add(e.data());
    },);
    return categories;
  }

  @override
  void listenIngCollectionCategories({required String uid, required EventFunction executeFunction}) {
    getCategoriesCollection(uid: uid).snapshots().listen((event) {
      List<CategoryModel> items = [];
      for(int i = 0 ; i < event.docs.length;i++){
        items.add(event.docs[i].data());
      }
      executeFunction(items);
    },);
  }
}