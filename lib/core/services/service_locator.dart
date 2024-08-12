import 'package:get_it/get_it.dart';
import 'package:task_management_app/core/services/firebase/database_services.dart';
import 'package:task_management_app/core/services/firebase/firebase_auth_service.dart';
import 'package:task_management_app/core/services/firebase/firebase_firestore_service.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator(){
    getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
    getIt.registerSingleton<DatabaseServices>(FirebaseDataBase());
    getIt.registerSingleton<AuthRepo>(
        AuthRepoImpl(
            databaseServices: getIt<DatabaseServices>(),
            firebaseAuthServices: getIt<FirebaseAuthServices>()
        ),
    );
}