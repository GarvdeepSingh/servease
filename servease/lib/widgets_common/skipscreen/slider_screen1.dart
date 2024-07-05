import 'package:flutter/material.dart';
import 'location_animation.dart';

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
                  AnimatedOnboardingContainer(
                    image: 'assets/images/image1.png',
                    title: '  Sit.Relax.Chill',
                    description: 'Every service on your doorstep',
                    reverseLayout: false,
                    animationDirection: AxisDirection.right,
                  ),
                  AnimatedOnboardingContainer(
                    image: 'assets/images/image2.png',
                    title: '  Tik.Tok.Ontime',
                    description: '         Reliable scheduling',
                    reverseLayout: true,
                    animationDirection: AxisDirection.left,
                  ),
                  AnimatedOnboardingContainer(
                    image: 'assets/images/image4.png',
                    title: 'Loveit.Bringiton',
                    description: 'Connecting people and things',
                    reverseLayout: false,
                    animationDirection: AxisDirection.right,
                  ),
                  AnimatedOnboardingContainer(
                    image: 'assets/images/image3.png',
                    title: '    Find.Discover',
                    description: '       Wide variety of services',
                    reverseLayout: true,
                    animationDirection: AxisDirection.left,
                  ),
                ],
              ),
              // New pages start here
              Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        bottom: 150,
                        child: Image.asset(
                          'assets/images/image5.png',
                          width: 470,
                          height: 470,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: [
                      AnimatedHomePage(), // Replace the specified part with AnimatedHomePage
                    ],
                  ),
                ),
              )
            ],
          ),
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
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
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
  final List<AnimatedOnboardingContainer> containers;

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

class AnimatedOnboardingContainer extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final bool reverseLayout;
  final AxisDirection animationDirection;

  AnimatedOnboardingContainer({
    required this.image,
    required this.title,
    required this.description,
    this.reverseLayout = false,
    required this.animationDirection,
  });

  @override
  _AnimatedOnboardingContainerState createState() =>
      _AnimatedOnboardingContainerState();
}

class _AnimatedOnboardingContainerState
    extends State<AnimatedOnboardingContainer> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isVisible = true;
      });
    });
  }

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
        children: widget.reverseLayout
            ? [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedSlide(
                        offset: _isVisible
                            ? Offset(0, 0)
                            : widget.animationDirection == AxisDirection.right
                                ? Offset(-1, 0)
                                : Offset(1, 0),
                        duration: Duration(seconds: 1),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      AnimatedSlide(
                        offset: _isVisible
                            ? Offset(0, 0)
                            : widget.animationDirection == AxisDirection.right
                                ? Offset(-1, 0)
                                : Offset(1, 0),
                        duration: Duration(seconds: 1),
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  widget.image,
                  height: 115,
                  width: 115,
                  fit: BoxFit.cover,
                ),
              ]
            : [
                Image.asset(
                  widget.image,
                  height: 115,
                  width: 115,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedSlide(
                        offset: _isVisible
                            ? Offset(0, 0)
                            : widget.animationDirection == AxisDirection.right
                                ? Offset(-1, 0)
                                : Offset(1, 0),
                        duration: Duration(seconds: 1),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      AnimatedSlide(
                        offset: _isVisible
                            ? Offset(0, 0)
                            : widget.animationDirection == AxisDirection.right
                                ? Offset(-1, 0)
                                : Offset(1, 0),
                        duration: Duration(seconds: 1),
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
      ),
    );
  }
}
