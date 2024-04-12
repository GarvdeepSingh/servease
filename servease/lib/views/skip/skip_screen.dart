// ignore: unused_import
import 'dart:math';

import 'package:servease/consts/consts.dart';

class skipscreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    //it will help us to return size of screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(


      body: Center(
        child: Column(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(para1,width: 300,)),
          
        ]),
      )
    
    );
  }
}