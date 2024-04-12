// ignore: unused_import
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:servease/consts/consts.dart';
import 'package:servease/widgets_common/skipscreen/screen1.dart';
// ignore: unnecessary_import
import 'package:velocity_x/velocity_x.dart';

class skipscreen extends StatelessWidget {
  const skipscreen({super.key});
continuemethod(){

}
  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    //it will help us to return size of screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
        TextButton(onPressed:continuemethod , child: Text('skip',style: TextStyle(color: color1,)))
    ],),
        body: Center(
            child: Column(
      children: [
        200.heightBox,
        Align(
          alignment: Alignment.center,
          child: screenwidget1(),
        ),
        10.heightBox,
        const Text(
          'Every service',
          style: TextStyle(
            fontSize: 50,
            color: color1,
            fontWeight: FontWeight.normal,
            fontFamily: ba,
          ),
        ),
        const SizedBox(
            width: 350,
            child: Text(
              'Everyday services at any \n hour at your doorstep one \nclick away!',
              style: TextStyle(
                fontSize: 20,
                color: color1,
                fontWeight: FontWeight.bold,
                fontFamily: ak,
              ),
              textAlign: TextAlign.center,
            )),
      ],
    )));
  }
}
