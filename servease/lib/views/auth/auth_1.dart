
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:servease/consts/consts.dart';
import 'package:servease/views/auth/login.dart';
// ignore: unused_import
import 'package:servease/views/auth/signup.dart';
import 'package:servease/views/auth/sign_in.dart';
import 'package:servease/widgets_common/skipscreen/screen1.dart';

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
        body: Column(children: [
          100.heightBox,
          Center(
            child: RichText(
              text: const TextSpan(
                style: const TextStyle(
                    color: Color.fromARGB(255, 250, 198, 44), fontSize: 60),
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
          const SizedBox(
            height: 80,
          ),
          OutlinedButton(
            onPressed: (() => Get.to(() => loginpage())),
            child: Text('Continue to Login / Signup'),
            style: OutlinedButton.styleFrom(
              minimumSize: Size(280, 60),
              textStyle: TextStyle(
                fontSize: 16,
                fontFamily: 'pro-bold',
              ),
              side: BorderSide(
                  width: 2, color: Color.fromARGB(255, 250, 198, 48)),
              foregroundColor: Color.fromARGB(255, 250, 198, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: (() => Get.to(() => google())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 8),
                Text(
                  'Continue with Google',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'pro-bold',
                  ),
                ),
              ],
            ),
            style: OutlinedButton.styleFrom(
              minimumSize: Size(280,
                  60), // Adjust height here for desired size (increased from 50)
              maximumSize:
                  Size(280, 60), // Set the same value for a fixed height
              side: BorderSide(
                width: 2,
                color: Color.fromARGB(255, 250, 198, 48),
              ),
              backgroundColor:
                  Colors.white, // Assuming you want white background
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          )
        ]));
  }
}
