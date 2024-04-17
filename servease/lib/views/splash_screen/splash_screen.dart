import 'package:flutter/material.dart';
// import 'package:servease/consts/colors.dart';
import 'package:servease/consts/consts.dart';
// ignore: unused_import
import 'dart:ffi';
import 'package:get/get.dart';
import 'package:servease/views/skip/skip_screen1.dart';
// ignore: unused_import
import 'package:velocity_x/velocity_x.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => splashscreenState();
}

class splashscreenState extends State<splashscreen> {
  changescreen() {
    Future.delayed(const Duration(seconds: 3), () {
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
      backgroundColor: Color.fromARGB(255, 250, 198, 44),
      body: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 60),
            children: [
              TextSpan(
                text: 'SERV',
                style: TextStyle(
                    fontFamily: 'assets/fomts/jom.ttf',
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
              ),
              TextSpan(
                text: 'ease',
                style: TextStyle(
                    fontFamily: 'assets/fomts/jom.ttf',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
