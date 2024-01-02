import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traccar/Controller/auth_controller.dart';
import 'Constants/theme.dart';
import 'Data/Local/hive_storage.dart';
import 'View/Splash/splash_screen.dart';
import 'View/auth_view/login_screen.dart';
import 'View/auth_view/signup_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TracCar',
      theme: AppTheme.lightTheme(context),
      home: const SplashScreen(),
    );
  }
}
