import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_management_app/provider/settings/settings_provider.dart';
import 'core/services/service_locator.dart';
import 'core/utils/observer/MyBlocObserver.dart';
import 'firebase_options.dart';
import 'my_app.dart';
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
    BlocProvider(create: (context) => SettingsProvider(),
    child: const MyApp()
    )
  );
}
