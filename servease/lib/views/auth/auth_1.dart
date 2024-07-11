import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servease/consts/consts.dart';
import 'package:servease/views/auth/login.dart';
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
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          90.heightBox,
          Center(
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                    color: Color.fromARGB(255, 250, 198, 44), fontSize: 60),
                children: [
                  TextSpan(
                    text: 'SERV',
                    style: TextStyle(
                        fontFamily: 'jom', fontSize: 100, color: whiteColor),
                  ),
                  TextSpan(
                    text: 'ease',
                    style: TextStyle(
                      fontFamily: 'jom',
                      fontSize: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: screenwidget1(),
          ),
          const SizedBox(
            height: 90,
          ),
          OutlinedButton(
            onPressed: () => Get.to(() => loginpage()),
            child: const Text('Continue to Login / Signup'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(280, 60),
              textStyle: const TextStyle(
                fontSize: 16,
                fontFamily: 'pro-bold',
              ),
              side: const BorderSide(
                  width: 2, color: Color.fromARGB(255, 250, 198, 48)),
              foregroundColor: const Color.fromARGB(255, 250, 198, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: () => Get.to(() => google()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Continue with Google',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'pro-bold',
                  ),
                ),
              ],
            ),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(280, 60),
              maximumSize: const Size(280, 60),
              side: const BorderSide(
                width: 2,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'By continuing you agree to Servease Terms and Conditions.',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontFamily: 'pro-regular',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
