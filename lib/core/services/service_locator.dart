import 'package:get_it/get_it.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:task_management_app/features/home_layout/data/home_layout_repo.dart';
import 'package:task_management_app/features/home_layout/data/home_layout_repo_impl.dart';
import 'package:task_management_app/features/profile/data/repos/profile_repo.dart';
import 'package:task_management_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:task_management_app/features/tasks_management/data/repos/tasks_management_repo.dart';
import '../../features/tasks_management/data/repos/tasks_management_repo_impl.dart';
import 'auth/services/auth_services.dart';
import 'auth/services_impl/firebase_auth_service.dart';
import 'database/database_firebase/firebase_database.dart';
import 'database/database_services/database_services.dart';


final getIt = GetIt.instance;
void setupServiceLocator(){
    getIt.registerSingleton<AuthServices>(FirebaseAuthServices());
    getIt.registerSingleton<DatabaseServices>(FirebaseDataBase());
    getIt.registerSingleton<AuthRepo>(
        AuthRepoImpl(
            databaseServices: getIt<DatabaseServices>(),
            authServices: getIt<AuthServices>()
        ),
    );
    getIt.registerSingleton<HomeLayoutRepo>(
        HomeLayoutRepoImpl(
            databaseServices: getIt<DatabaseServices>(),
            authServices: getIt<AuthServices>()
        ),
    );
    getIt.registerSingleton<ProfileRepo>(
        ProfileRepoImpl(
            databaseServices: getIt<DatabaseServices>(),
            authServices: getIt<AuthServices>()
        ),
    );
    getIt.registerSingleton<TasksManagementRepo>(
        TasksManagementRepoImpl(
            databaseServices: getIt<DatabaseServices>(),
        ),
    );
}