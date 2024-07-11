import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servease/views/auth/auth_1.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<splashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const auth(),
          transition: Transition.fadeIn, duration: Duration(seconds: 1));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 198, 44),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRect(
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Text(
                      'SERV',
                      style: const TextStyle(
                        fontFamily: 'jom',
                        fontSize: 115,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'ease',
                  style: TextStyle(
                    fontFamily: 'jom',
                    fontSize: 115,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
