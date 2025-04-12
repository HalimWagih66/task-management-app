import 'package:task_management_app/core/services/database/database_firebase/database/tasks_database_firestore.dart';
import 'package:task_management_app/core/services/database/database_services/database_interface/categories_database.dart';
import 'package:task_management_app/core/services/database/database_services/database_interface/storage_database.dart';
import 'package:task_management_app/core/services/database/database_services/database_interface/tasks_database.dart';
import 'package:task_management_app/core/services/database/database_services/database_interface/users_database.dart';
import 'database/categories_database_firestore.dart';
import 'database/storage_database_firebase.dart';
import 'database/users_database_firestore.dart';
import '../database_services/database_services.dart';

class FirebaseDataBase implements DatabaseServices{
  @override
  CategoriesDatabase categoriesDatabase = CategoriesDatabaseFirestore();

  @override
  StorageDatabase storageDatabase = StorageDatabaseFirebase();

  @override
  UsersDatabase usersDatabase = UsersDatabaseFirestore();

  @override
  TasksDatabase tasksDatabase = TasksDatabaseFirestore();
}