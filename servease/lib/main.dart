import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:servease/category/elec.dart';
// ignore: unused_import
import 'package:servease/views/auth/auth_1.dart';
// ignore: unused_import
import 'package:servease/views/auth/sign_in.dart';
// ignore: unused_import
import 'package:servease/views/home/get_lat_long.dart';
// ignore: unused_import
import 'package:servease/views/home/home.dart';
// ignore: unused_import
import 'package:servease/views/skip/skip_screen.dart';
// ignore: unused_import
import 'package:servease/views/skip/skip_screen1.dart';
// ignore: unused_import
import 'package:servease/views/splash_screen/splash_screen.dart';
import 'package:servease/widgets_common/location.dart';
import 'package:servease/widgets_common/skipscreen/location_animation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCGtSpqY0-aG5zS9kgJR2Z6FQVN5dtUBz8",
            authDomain: "demo1-2060d.firebaseapp.com",
            projectId: "demo1-2060d",
            storageBucket: "demo1-2060d.appspot.com",
            messagingSenderId: "184524377173",
            appId: "1:184524377173:web:80332c0641f8e78bff98dc"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Servease',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: splashScreen(),
    );
  }
}
