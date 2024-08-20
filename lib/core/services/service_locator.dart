import 'package:get_it/get_it.dart';
import 'package:task_management_app/core/services/firebase/services/auth_services.dart';
import 'package:task_management_app/core/services/firebase/services/database_services.dart';
import 'package:task_management_app/core/services/firebase/services_impl/firebase_auth_service.dart';
import 'package:task_management_app/core/services/firebase/services_impl/firebase_firestore_service.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:task_management_app/features/home_layout/data/home_layout_repo.dart';
import 'package:task_management_app/features/home_layout/data/home_layout_repo_impl.dart';


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
        ),
    );
}