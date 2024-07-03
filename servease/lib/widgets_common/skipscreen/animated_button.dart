import 'package:flutter/material.dart';
import 'package:servease/consts/consts.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String buttonText;

  AnimatedButton({
    required this.onPressed,
    this.backgroundColor = color4,
    this.buttonText = 'GET STARTED',
  });

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1), // Button starts above the screen
      end: Offset(0, 0), // Button ends at the bottom center of the screen
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _sizeAnimation = Tween<double>(
      begin: 0.3, // Button starts small
      end: 1.0, // Button ends at full size
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward(); // Start the animation when the page is opened
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SlideTransition(
        position: _slideAnimation,
        child: SizeTransition(
          sizeFactor: _sizeAnimation,
          axisAlignment: -1.0,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
              bottom: 60,
            ), // Adjust bottom padding as needed
            child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.backgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                widget.buttonText,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'assets/fomts/jom.ttf',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
