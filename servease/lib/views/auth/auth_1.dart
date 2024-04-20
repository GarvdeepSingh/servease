import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:servease/consts/consts.dart';
import 'package:servease/views/auth/login.dart';
import 'package:servease/views/auth/signup.dart';
import 'package:servease/views/auth/sign_in.dart';
import 'package:servease/widgets_common/skipscreen/screen1.dart';
import 'package:velocity_x/velocity_x.dart';

class auth extends StatefulWidget {
  const auth({super.key});

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          100.heightBox,
          Center( child: 
          RichText(
          text: const TextSpan(
            style: const TextStyle(color: Color.fromARGB(255, 250, 198, 44), fontSize: 60),
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
        20.heightBox,
        Align(
          alignment: Alignment.center,
          child: screenwidget1(),
        ),
         const SizedBox(height: 50,),
         OutlinedButton(onPressed: (()=>Get.to(() =>mysignup())), child: Text('Continue to Login / Signup'),style:OutlinedButton.styleFrom(
          minimumSize: Size(280, 60),
          textStyle: TextStyle(fontSize: 20),
          side: BorderSide(width: 2,color: Color.fromARGB(255, 250, 198, 48)),
         ),),
          const SizedBox(height: 50,),
         OutlinedButton(onPressed: (()=>Get.to(() =>google())), child: Text('Continue with Google'),style:OutlinedButton.styleFrom(
          minimumSize: Size(280, 60),
          textStyle: TextStyle(fontSize: 20),
          side: BorderSide(width: 2,color: Color.fromARGB(255, 250, 198, 48)),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),))
        ])
        
      ); 
   
  }
}