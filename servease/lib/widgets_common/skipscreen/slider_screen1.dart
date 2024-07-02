import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:servease/consts/consts.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              OnboardingPage(
                containers: [
                  OnboardingContainer(
                    image: 'assets/images/image1.png',
                    title: 'Sit.Relax.Chill',
                    description: 'Every service on your doorstep',
                    reverseLayout: false,
                  ),
                  OnboardingContainer(
                    image: 'assets/images/image2.png',
                    title: 'Tik.Tok.Ontime',
                    description: 'Reliable scheduling',
                    reverseLayout: true,
                  ),
                  OnboardingContainer(
                    image: 'assets/images/image4.png',
                    title: 'Loveit.Bringiton',
                    description: 'Connecting people and things',
                    reverseLayout: false,
                  ),
                  OnboardingContainer(
                    image: 'assets/images/image3.png',
                    title: 'Find.Discover',
                    description: 'Wide variety of services',
                    reverseLayout: true,
                  ),
                ],
              ),
              // Add more pages if needed
            ],
          ),
          Stack(children: [
            Positioned(
              top: 50,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  // Handle skip action
                },
                child: Text('SKIP'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ]),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: _currentIndex == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.black : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final List<OnboardingContainer> containers;

  OnboardingPage({required this.containers});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 50.0),
          ...containers.map((container) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: container,
            );
          }).toList(),
        ],
      ),
    );
  }
}

class OnboardingContainer extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final bool reverseLayout;

  OnboardingContainer({
    required this.image,
    required this.title,
    required this.description,
    this.reverseLayout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: reverseLayout
            ? [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10), // Adjust this value to control the gap
                Image.asset(
                  image,
                  height: 115, // Increased height
                  width: 115, // Increased width
                  fit: BoxFit.cover, // Ensure the image covers the space
                ),
              ]
            : [
                Image.asset(
                  image,
                  height: 115, // Increased height
                  width: 115, // Increased width
                  fit: BoxFit.cover, // Ensure the image covers the space
                ),
                SizedBox(width: 10), // Adjust this value to control the gap
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
      ),
    );
  }
}
