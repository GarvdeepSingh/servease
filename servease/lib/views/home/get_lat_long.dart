// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:servease/widgets_common/cat_mod.dart'; // Assuming you have this import for category data
// import 'package:servease/widgets_common/profile.dart'; // Import the profile screen

// class GetLatLongScreen extends StatefulWidget {
//   const GetLatLongScreen({Key? key}) : super(key: key);

//   @override
//   State<GetLatLongScreen> createState() => _GetLatLongScreenState();
// }

// class _GetLatLongScreenState extends State<GetLatLongScreen> {
//   String address = "Fetching location...";
//   String error = "";
//   int _selectedIndex = 1; // Default to home screen
//   TextEditingController nameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     getLatLong();
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }

//   void getLatLong() {
//     _determinePosition().then((value) {
//       getAddress(value.latitude, value.longitude);
//     }).catchError((error) {
//       setState(() {
//         this.error = error.toString();
//       });
//     });
//   }

//   void getAddress(double lat, double long) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
//       setState(() {
//         address = placemarks.isNotEmpty
//             ? "${placemarks[0].subLocality}, ${placemarks[0].locality}"
//             : "Unknown location";
//       });
//     } catch (e) {
//       setState(() {
//         error = e.toString();
//       });
//     }
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Set background color to white
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         leading: IconButton(
//           icon:
//               Icon(Icons.menu, color: Colors.black), // Set icon color to black
//           onPressed: () {
//             // Handle menu button press
//           },
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.location_on,
//                 color: Colors.black), // Set icon color to black
//             SizedBox(width: 8),
//             Text(
//               error.isEmpty ? address : "Error",
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                   fontSize: 18, color: Colors.black), // Set text color to black
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications,
//                 color: Colors.black), // Set icon color to black
//             onPressed: () {
//               // Handle notification bell press
//             },
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(kToolbarHeight + 2),
//           child: Container(
//             color: Colors.white, // Set the background color to white
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 2),
//               child: Container(
//                 height: 40,
//                 width: 366.0,
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 238, 238, 238),
//                   borderRadius: BorderRadius.circular(19.94),
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search',
//                     hintStyle: TextStyle(fontSize: 16),
//                     contentPadding: EdgeInsets.all(6),
//                     border: InputBorder.none,
//                     prefixIcon: Icon(Icons.search),
//                     filled: true,
//                     fillColor:
//                         Color(0xFFEEEEEE), // Set the search bar color here
//                   ),
//                   onChanged: (value) {
//                     // Handle search functionality here
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: IndexedStack(
//           index: _selectedIndex,
//           children: [
//             buildCategoriesScreen(),
//             buildHomeScreen(),
//             ProfileScreen(
//                 nameController:
//                     nameController), // Use the ProfileScreen widget here
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildHomeScreen() {
//     // List of image paths and texts for the horizontal list
//     final List<Map<String, String>> deals = [
//       {
//         'image': 'assets/images/deal_0.png',
//         'text': '12 hours Cooking service',
//         'description': 'Meal packages',
//       },
//       {
//         'image': 'assets/images/deal_1.png',
//         'text': '1+1 services for 1st time u..',
//         'description': 'One time offer',
//       },
//       {
//         'image': 'assets/images/deal_2.png',
//         'text': 'Car services',
//         'description': 'Low prices, Premium',
//       },
//     ];

//     final List<Map<String, String>> topRated = [
//       {
//         'image': 'assets/images/top_0.png',
//         'text': 'Mechanic',
//       },
//       {
//         'image': 'assets/images/top_1.png',
//         'text': 'AC service',
//       },
//       {
//         'image': 'assets/images/top_2.png',
//         'text': 'Pet Sitting',
//       },
//       {
//         'image': 'assets/images/top_3.png',
//         'text': 'Gardener',
//       },
//     ];

//     final List<Map<String, String>> within900m = [
//       {
//         'image': 'assets/images/near_0.png',
//         'text': 'Electrician',
//       },
//       {
//         'image': 'assets/images/near_1.png',
//         'text': 'AC service',
//       },
//       {
//         'image': 'assets/images/near_2.png',
//         'text': 'Gardener',
//       },
//       {
//         'image': 'assets/images/near_3.png',
//         'text': 'Car service',
//       },
//     ];

//     return Padding(
//       padding: EdgeInsets.all(8),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Categories",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontFamily: 'uberB',
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             SizedBox(
//               height: 100,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: Categorydata.length,
//                 itemBuilder: (context, index) => Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Material(
//                     elevation: 0,
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       height: 80,
//                       width: 64,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 55,
//                             width: 64,
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 238, 238, 238),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: Icon(Categorydata[index].icon),
//                             ),
//                           ),
//                           Container(
//                             height: 30,
//                             width: 64,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 Categorydata[index].name,
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 2),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Grab Deals",
//                 style: TextStyle(fontSize: 20, fontFamily: 'uberB'),
//               ),
//             ),
//             SizedBox(height: 10),
//             SizedBox(
//               height: 180, // Adjust height as needed
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: deals.length,
//                 itemBuilder: (context, index) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: 160, // Adjust width as needed
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       children: [
//                         Material(
//                           elevation:
//                               4.0, // Add elevation to highlight the images
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             height: 100, // Increased height
//                             width: 160, // Increased width
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color:
//                                   Colors.white, // Set background color to white
//                               image: DecorationImage(
//                                 image: AssetImage(deals[index]['image']!),
//                                 fit: BoxFit.scaleDown,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                             height: 5), // Add spacing between image and text
//                         Container(
//                           height: 30,
//                           width: 160,
//                           child: Align(
//                             alignment:
//                                 Alignment.centerLeft, // Align text to left
//                             child: Text(
//                               deals[index]['text']!,
//                               style:
//                                   TextStyle(fontSize: 12, fontFamily: 'uber'),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 20,
//                           width: 160,
//                           child: Align(
//                             alignment:
//                                 Alignment.centerLeft, // Align text to left
//                             child: Text(
//                               deals[index]['description']!,
//                               style: TextStyle(
//                                   fontSize: 11,
//                                   fontFamily: 'uber',
//                                   color:
//                                       const Color.fromARGB(255, 123, 122, 122)),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 2),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Top rated",
//                 style: TextStyle(fontSize: 20, fontFamily: 'uberB'),
//               ),
//             ),
//             SizedBox(height: 10),
//             SizedBox(
//               height: 160, // Adjust height as needed
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: topRated.length,
//                 itemBuilder: (context, index) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: 160, // Adjust width as needed
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       children: [
//                         Material(
//                           elevation:
//                               4.0, // Add elevation to highlight the images
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             height: 100, // Set height to make it square
//                             width: 100, // Set width to make it square
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color:
//                                   Colors.white, // Set background color to white
//                               image: DecorationImage(
//                                 image: AssetImage(topRated[index]['image']!),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                             height: 5), // Add spacing between image and text
//                         Container(
//                           height: 30,
//                           width: 160,
//                           child: Align(
//                             alignment:
//                                 Alignment.centerLeft, // Align text to left
//                             child: Text(
//                               topRated[index]['text']!,
//                               style:
//                                   TextStyle(fontSize: 12, fontFamily: 'uber'),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 2),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Within 900m",
//                 style: TextStyle(fontSize: 20, fontFamily: 'uberB'),
//               ),
//             ),
//             SizedBox(height: 10),
//             SizedBox(
//               height: 160, // Adjust height as needed
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: within900m.length,
//                 itemBuilder: (context, index) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: 160, // Adjust width as needed
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       children: [
//                         Material(
//                           elevation:
//                               4.0, // Add elevation to highlight the images
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             height: 100, // Set height to make it square
//                             width: 100, // Set width to make it square
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color:
//                                   Colors.white, // Set background color to white
//                               image: DecorationImage(
//                                 image: AssetImage(within900m[index]['image']!),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                             height: 5), // Add spacing between image and text
//                         Container(
//                           height: 30,
//                           width: 160,
//                           child: Align(
//                             alignment:
//                                 Alignment.centerLeft, // Align text to left
//                             child: Text(
//                               within900m[index]['text']!,
//                               style:
//                                   TextStyle(fontSize: 12, fontFamily: 'uber'),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildCategoriesScreen() {
//     // Build your categories screen here
//     return Center(child: Text('Categories Screen'));
//   }
// }


import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:servease/widgets_common/cat_mod.dart'; // Assuming you have this import for category data
import 'package:servease/widgets_common/profile.dart'; // Import the profile screen

class GetLatLongScreen extends StatefulWidget {
  const GetLatLongScreen({Key? key}) : super(key: key);

  @override
  State<GetLatLongScreen> createState() => _GetLatLongScreenState();
}

class _GetLatLongScreenState extends State<GetLatLongScreen> {
  String address = "Fetching location...";
  String error = "";
  int _selectedIndex = 1; // Default to home screen
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getLatLong();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void getLatLong() {
    _determinePosition().then((value) {
      getAddress(value.latitude, value.longitude);
    }).catchError((error) {
      setState(() {
        this.error = error.toString();
      });
    });
  }

  void getAddress(double lat, double long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      setState(() {
        address = placemarks.isNotEmpty
            ? "${placemarks[0].subLocality}, ${placemarks[0].locality}"
            : "Unknown location";
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background to white
        leading: IconButton(
          icon:
              Icon(Icons.menu, color: Colors.black), // Set icon color to black
          onPressed: () {
            // Handle menu button press
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on,
                color: Colors.black), // Set icon color to black
            SizedBox(width: 8),
            Text(
              error.isEmpty ? address : "Error",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18, color: Colors.black), // Set text color to black
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,
                color: Colors.black), // Set icon color to black
            onPressed: () {
              // Handle notification bell press
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 2),
          child: Container(
            color: Colors.white, // Set the background color to white
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                height: 40,
                width: 366.0,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 238, 238, 238),
                  borderRadius: BorderRadius.circular(19.94),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 16),
                    contentPadding: EdgeInsets.all(6),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor:
                        Color(0xFFEEEEEE), // Set the search bar color here
                  ),
                  onChanged: (value) {
                    // Handle search functionality here
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            buildCategoriesScreen(),
            buildHomeScreen(),
            ProfileScreen(
                nameController:
                    nameController), // Use the ProfileScreen widget here
          ],
        ),
      ),
    );
  }

  Widget buildHomeScreen() {
    // List of image paths and texts for the horizontal list
    final List<Map<String, String>> deals = [
      {
        'image': 'assets/images/deal_0.png',
        'text': '12 hours Cooking service',
        'description': 'Meal packages',
      },
      {
        'image': 'assets/images/deal_1.png',
        'text': '1+1 services for 1st time u..',
        'description': 'One time offer',
      },
      {
        'image': 'assets/images/deal_2.png',
        'text': 'Car services',
        'description': 'Low prices, Premium',
      },
    ];

    final List<Map<String, String>> topRated = [
      {
        'image': 'assets/images/top_0.png',
        'text': 'Mechanic',
      },
      {
        'image': 'assets/images/top_1.png',
        'text': 'AC service',
      },
      {
        'image': 'assets/images/top_2.png',
        'text': 'Pet Sitting',
      },
      {
        'image': 'assets/images/top_3.png',
        'text': 'Gardener',
      },
    ];

    final List<Map<String, String>> within900m = [
      {
        'image': 'assets/images/near_0.png',
        'text': 'Electrician',
      },
      {
        'image': 'assets/images/near_1.png',
        'text': 'AC service',
      },
      {
        'image': 'assets/images/near_2.png',
        'text': 'Gardener',
      },
      {
        'image': 'assets/images/near_3.png',
        'text': 'Car service',
      },
    ];

    return Padding(
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'uberB',
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categorydata.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 80,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Column(
                        children: [
                          Container(
                          height: 55,
                          width: 64,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 238, 238, 238),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(Categorydata[index].icon),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 64,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              Categorydata[index].name,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Grab Deals",
                style: TextStyle(fontSize: 20, fontFamily: 'uberB'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 180, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: deals.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 160, // Adjust width as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            deals[index]['image']!,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                deals[index]['text']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                deals[index]['description']!,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2), // Adjust the height to reduce gap
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Top rated",
                style: TextStyle(fontSize: 20, fontFamily: 'uberB'),
              ),
            ),
            SizedBox(height: 10), // Reduce the height to reduce gap
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              children: List.generate(topRated.length, (index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        topRated[index]['image']!,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      topRated[index]['text']!,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 2), // Adjust the height to reduce gap
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Within 900m",
                style: TextStyle(fontSize: 20, fontFamily: 'uberB'),
              ),
            ),
            SizedBox(height: 10), // Reduce the height to reduce gap
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              children: List.generate(within900m.length, (index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        within900m[index]['image']!,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      within900m[index]['text']!,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

   Widget buildCategoriesScreen() {
    // Build your categories screen here
    return Center(child: Text('Categories Screen'));
  }
}