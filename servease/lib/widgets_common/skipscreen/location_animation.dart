import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:servease/views/home/get_lat_long.dart';
import 'package:servease/widgets_common/location.dart';

class AnimatedHomePage extends StatefulWidget {
  @override
  _AnimatedHomePageState createState() => _AnimatedHomePageState();
}

class _AnimatedHomePageState extends State<AnimatedHomePage> {
  bool _isExpanded = false;
  bool _isColorChanged = false;
  bool _isImageVisible = false;
  bool _showSplashScreen = false;
  bool _greyScreenVisible = true;
  bool _isImage6Visible = true;
  double _splashOpacity = 0.0;
  double _imageTopPosition = 500;
  double _buttonOpacity = 1.0;
  double _buttonBottomPosition = 800; // Initial position of the button (off-screen)
  String _locality = "fetching..."; // State variable for the locality

  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _buttonBottomPosition = 70; // Final position of the button
      });
    });
  }

  Future<void> _getLocationAndLocality() async {
    try {
      Position position = await _locationService.determinePosition();
      String locality = await _locationService.getLocality(position.latitude, position.longitude);
      setState(() {
        _locality = locality;
      });
    } catch (e) {
      setState(() {
        _locality = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: _isColorChanged ? Colors.grey.withOpacity(0.5) : Colors.white,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            bottom: _isImageVisible ? 0 : -1000, // Adjust the height based on your image
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Location.png', // Replace with your image path
              height: 1000, // Adjust the height based on your image
            ),
          ),
          if (_showSplashScreen)
            AnimatedOpacity(
              opacity: _splashOpacity,
              duration: Duration(milliseconds: 800),
              child: Stack(
                children: [
                  if (_greyScreenVisible)
                    Positioned.fill(
                      child: Container(
                        color: Colors.grey, // Grey screen for splash screen
                      ),
                    ),
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/Map.png', // Replace with your background image path
                      fit: BoxFit.cover,
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 800),
                    top: _imageTopPosition,
                    left: MediaQuery.of(context).size.width / 2 - 100, // Center the image
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/Location.png', // Replace with your stack image path
                          width: 200, // Adjust the width based on your image
                          height: 200, // Adjust the height based on your image
                        ),
                        SizedBox(height: 20),
                        Text(
                          _locality,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            bottom: _buttonBottomPosition,
            left: _isExpanded ? 0 : MediaQuery.of(context).size.width / 2 - 150, // Adjust left position for expansion
            right: _isExpanded ? 0 : MediaQuery.of(context).size.width / 2 - 150, // Adjust right position for expansion
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  _isExpanded = true;
                  _isImage6Visible = false; // Make image6 invisible
                });
                await Future.delayed(Duration(milliseconds: 500));
                setState(() {
                  _buttonOpacity = 0.0;
                  _isColorChanged = true;
                });
                await Future.delayed(Duration(milliseconds: 500));
                setState(() {
                  _isImageVisible = true;
                });
                await Future.delayed(Duration(milliseconds: 500));
                setState(() {
                  _showSplashScreen = true;
                  _splashOpacity = 1.0;
                  _imageTopPosition = 200; // Change to the final position
                });
                await Future.delayed(Duration(milliseconds: 400));
                setState(() {
                  _greyScreenVisible = false;
                });
                await Future.delayed(Duration(seconds: 1)); // Splash screen duration
                await _getLocationAndLocality(); // Get location and locality
                await Future.delayed(Duration(seconds: 1)); // Display locality for a while
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetLatLongScreen()),
                );
              },
              child: AnimatedOpacity(
                opacity: _buttonOpacity,
                duration: Duration(milliseconds: 500),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: _isExpanded ? MediaQuery.of(context).size.height : 70.0, // Full height when expanded
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _isColorChanged ? Color.fromARGB(255, 211, 208, 186) : Color.fromARGB(255, 255, 218, 53),
                    borderRadius: BorderRadius.circular(25.0), // Increased border radius
                  ),
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      fontSize: 54,
                      color: const Color.fromARGB(255, 20, 20, 20),
                      fontFamily: 'jom', // Use your custom font
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_isImage6Visible)
            Positioned(
              left: -137.5,
              bottom: 150,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/image6.png',
                    width: 435.5,
                    height: 435.5,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
