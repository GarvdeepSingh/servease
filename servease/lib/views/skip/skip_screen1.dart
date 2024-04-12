// ignore: unused_import
import 'dart:math';

import 'package:servease/consts/consts.dart';
import 'package:servease/widgets_common/screen2.dart';
import 'package:servease/widgets_common/skipscreen/screen1.dart';
// ignore: unnecessary_import
import 'package:velocity_x/velocity_x.dart';

class skipscreen1 extends StatelessWidget {
  const skipscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    //it will help us to return size of screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        200.heightBox,
        Align(
          alignment: Alignment.center,
          child: screenwidget2(),
        ),
        10.heightBox,
        const SizedBox(
          width: 350,
          child: Text(
            'Affordable rates',
            style: TextStyle(
              fontSize: 43,
              color: color1,
              fontWeight: FontWeight.normal,
              fontFamily: ba,
            ),
          ),
        ),
        const SizedBox(
            width: 350,
            child: Text(
              'Serivces at your local rates with \nfacility to bargain',
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
