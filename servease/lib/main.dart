import 'package:flutter/material.dart';
import 'package:servease/views/skip/skip_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'servease',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: skipscreen(),
    );
  }
}

