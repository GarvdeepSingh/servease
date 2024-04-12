import 'package:flutter/material.dart';
import 'package:servease/consts/colors.dart';
import 'package:servease/consts/consts.dart';
import 'dart:ffi';
import 'package:servease/views/skip/skip_screen.dart';
import 'package:get/get.dart';
class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => splashscreenState();
}

class splashscreenState extends State<splashscreen> {


 changescreen(){
    Future.delayed(const Duration(seconds: 3),(){
      Get.to(() => skipscreen());
    });
  }

  void initState() {
    super.initState();
    changescreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Center(
          child: Column(
            children: [
                    Image.asset(
                    'assets/images/charity box.png',
                    width: 300,
                  ),
              // 20.heightBox,
              // applogowidget(),
              // 10.heightBox,
              // appname.text.fontFamily(bold).size(22).white.make(),
              // 5.heightBox,
              // appversion.text.white.make(),
              // const Spacer(),
              // credits.text.white.fontFamily(semibold).make(),
              // 30.heightBox,
            ],
          ),
        ));
  }
}
