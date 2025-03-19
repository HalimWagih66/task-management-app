import 'package:task_management_app/core/services/database/database_services/database_interface/tasks_database.dart';
import 'package:task_management_app/core/services/database/database_services/database_interface/users_database.dart';
import 'database_interface/categories_database.dart';
import 'database_interface/storage_database.dart';

abstract class DatabaseServices{
  late UsersDatabase usersDatabase;
  late CategoriesDatabase categoriesDatabase;
  late StorageDatabase storageDatabase;
  late TasksDatabase tasksDatabase;
}