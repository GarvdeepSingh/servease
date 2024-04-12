import 'package:flutter/material.dart';
import 'package:servease/consts/colors.dart';
import 'package:servease/consts/consts.dart';
import 'package:servease/consts/images.dart';
import 'package:servease/consts/styles.dart';
import 'package:servease/consts/strings.dart';
import 'dart:ffi';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => splashscreenState();
}

class splashscreenState extends State<splashscreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Center(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/charity box.png',
                    width: 300,
                  )),
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
