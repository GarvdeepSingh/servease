// ignore: unused_import
import 'dart:math';

import 'package:servease/consts/consts.dart';
import 'package:servease/widgets_common/skipscreen/screen1.dart';

class skipscreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    //it will help us to return size of screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(


      body: Center(
        child: Column(
          children: [
            20.heightBox,
            Align(
              alignment: Alignment.center,
              child: screenwidget1(),
              
            )
          ],
        )
      )
    
    );
  }
}