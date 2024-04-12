import 'package:flutter/material.dart';
import 'package:servease/consts/colors.dart';
import 'package:servease/consts/consts.dart';
// ignore: unused_import
import 'dart:ffi';
import 'package:get/get.dart';
import 'package:servease/views/skip/skip_screen1.dart';
import 'package:servease/widgets_common/splash.dart';
import 'package:velocity_x/velocity_x.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => splashscreenState();
}

class splashscreenState extends State<splashscreen> {
  changescreen() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => onboard());
    });
  }

  void initState() {
    super.initState();
    changescreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      325.heightBox,
      Align(
        alignment: Alignment.center,
        child: splash(),
      ),
      10.heightBox,
      const Text(
        'SERVEASE',
        style: TextStyle(
          fontSize: 60,
          color: color1,
          fontWeight: FontWeight.normal,
          fontFamily: jk,
        ),
      ),
    ])));
  }
}
