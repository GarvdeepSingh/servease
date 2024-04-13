import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:servease/views/skip/skip_screen.dart';
// ignore: unused_import
import 'package:servease/views/skip/skip_screen1.dart';
import 'package:servease/views/splash_screen/splash_screen.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'servease',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const splashscreen(),
    );
  }
}
