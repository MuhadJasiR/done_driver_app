import 'package:done_driver_app/auth/view/splash_screen.dart';
import 'package:done_driver_app/helper/init_dependency.dart';
import 'package:done_driver_app/core/theme/theme_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBNatTvkVHhDJ8YxkLbxDV3GOzJQTUnSjc",
    appId: "1:999771098348:android:47d09da2f46a4a56a969c9",
    messagingSenderId: "999771098348",
    projectId: "flutter-auth-90bb2",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDependency(),
      theme: themeData,
      home: const SplashScreen(),
    );
  }
}
