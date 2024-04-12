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
            200.heightBox,
            Align(
              alignment: Alignment.center,
              child: screenwidget1(),
              ),
            10.heightBox,
            const Text('Every service', style: TextStyle(
              fontSize: 50,
              color: color1,
              fontWeight: FontWeight.normal,
              fontFamily: ba,
            ),),
            
            const SizedBox(
              width: 350,
             
               child:Text('Everyday services at any \n hour at your doorstep one \nclick away!',style: TextStyle(
                fontSize: 20,
                color: color1,
                fontWeight: FontWeight.bold,
                fontFamily: ak,
              ),textAlign: TextAlign.center,
            )),

          ],
        )
      )
    
    );
  }
}