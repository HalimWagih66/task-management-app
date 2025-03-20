import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_management_app/features/tasks_management/data/repos/tasks_management_repo.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';
import 'package:task_management_app/task_management_app.dart';
import 'package:task_management_app/provider/settings/settings_provider.dart';
import 'package:task_management_app/provider/settings/settings_state.dart';
import 'core/services/service_locator.dart';
import 'core/utils/observer/MyBlocObserver.dart';
import 'firebase_options.dart';
import 'core/utils/constant/cache/hive_keys.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox(SETTINGS_KEY);
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => SettingsProvider()),
        BlocProvider(create: (context) => ControlTasksCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>())),
      ], child: BlocBuilder<SettingsProvider,SettingsState>(
        builder: (context, state) => TaskManagementApp(),
      ),
      ),
    )
  );
}
