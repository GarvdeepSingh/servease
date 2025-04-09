// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:servease/consts/consts.dart';
// import 'package:servease/views/home/get_lat_long.dart';
// import 'package:servease/widgets_common/location.dart'; // Ensure the path is correct

// class Elec extends StatefulWidget {
//   const Elec({Key? key}) : super(key: key);

//   @override
//   State<Elec> createState() => _ElecState();
// }

// class _ElecState extends State<Elec> {
//   String locality = "Unknown"; // Default locality
//   Stream<QuerySnapshot>? _userStream;
//   final LocationService locationService = LocationService();
//   String error = "";
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     getLatLong(); // Fetch location on init
//   }

//   void getLatLong() {
//     locationService.determinePosition().then((position) {
//       locationService
//           .getLocality(position.latitude, position.longitude)
//           .then((loc) {
//         setState(() {
//           locality = loc;
//           print("Locality: $locality"); // Debugging line
//           _getUserStream();
//         });
//       }).catchError((error) {
//         setState(() {
//           this.error = error.toString();
//         });
//       });
//     }).catchError((error) {
//       setState(() {
//         this.error = error.toString();
//       });
//     });
//   }

//   void _getUserStream() async {
//     setState(() {
//       _userStream = FirebaseFirestore.instance
//           .collection(locality) // Use the locality value as collection name
//           .doc('1')
//           .collection('elec')
//           .snapshots();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Electricians near you",
//           style: TextStyle(
//             color: Colors.black,
//             fontFamily: 'uber', // Set your custom font family
//           ),
//           textAlign: TextAlign.center,
//         ),
//         backgroundColor: Colors.white,
//         centerTitle: true, // Center the title
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => GetLatLongScreen()),
//             );
//           },
//         ),
//         iconTheme: IconThemeData(
//             color: Colors.black), // Change the app bar icon color to black
//       ),
//       body: Container(
//         color: Colors.white,
//         child: error.isNotEmpty
//             ? Center(child: Text('Error: $error'))
//             : Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             height: 40,
//                             padding: EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 235, 233, 233),
//                               borderRadius: BorderRadius.circular(19.94),
//                             ),
//                             child: TextField(
//                               controller: searchController,
//                               decoration: InputDecoration(
//                                 hintText: 'Search',
//                                 hintStyle: TextStyle(fontSize: 16),
//                                 contentPadding: EdgeInsets.all(6),
//                                 border: InputBorder.none,
//                                 prefixIcon: Icon(Icons.search),
//                                 filled: true,
//                                 fillColor: Color.fromARGB(255, 235, 233, 233),
//                               ),
//                               onChanged: (value) {
//                                 // Handle search functionality here
//                                 // Update the _userStream based on search query if needed
//                               },
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.filter_list, color: Colors.black),
//                           onPressed: () {
//                             // Handle filter button press
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: 8.0),
//                           child: Chip(
//                             label: Text('Sort'),
//                             backgroundColor: Colors.grey[300],
//                             shape: StadiumBorder(
//                               side: BorderSide(
//                                   color: Colors.grey[
//                                       300]!), // Same as background color to remove border
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 8.0),
//                           child: Chip(
//                             label: Text('Nearest'),
//                             backgroundColor: Colors.grey[300],
//                             shape: StadiumBorder(
//                               side: BorderSide(
//                                   color: Colors.grey[
//                                       300]!), // Same as background color to remove border
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 8.0),
//                           child: Chip(
//                             label: Text('Offers'),
//                             backgroundColor: Colors.grey[300],
//                             shape: StadiumBorder(
//                               side: BorderSide(
//                                   color: Colors.grey[
//                                       300]!), // Same as background color to remove border
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 8.0),
//                           child: Chip(
//                             label: Text('Rating 4+'),
//                             backgroundColor: Colors.grey[300],
//                             shape: StadiumBorder(
//                               side: BorderSide(
//                                   color: Colors.grey[
//                                       300]!), // Same as background color to remove border
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 8.0),
//                           child: Chip(
//                             label: Text('Previously'),
//                             backgroundColor: Colors.grey[300],
//                             shape: StadiumBorder(
//                               side: BorderSide(
//                                   color: Colors.grey[
//                                       300]!), // Same as background color to remove border
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     child: _userStream == null
//                         ? Center(child: CircularProgressIndicator())
//                         : StreamBuilder(
//                             stream: _userStream,
//                             builder: (context,
//                                 AsyncSnapshot<QuerySnapshot> snapshot) {
//                               if (snapshot.hasError) {
//                                 return Center(child: Text('Connection error'));
//                               }
//                               if (snapshot.connectionState ==
//                                   ConnectionState.waiting) {
//                                 return Center(
//                                     child: CircularProgressIndicator());
//                               }
//                               if (!snapshot.hasData ||
//                                   snapshot.data!.docs.isEmpty) {
//                                 return Center(child: Text('No data available'));
//                               }

//                               print(
//                                   "Documents: ${snapshot.data!.docs}"); // Debugging line

//                               var docs = snapshot.data!.docs;
//                               return ListView.builder(
//                                 itemCount: docs.length,
//                                 itemBuilder: (context, index) {
//                                   var doc = docs[index];
//                                   return Container(
//                                     margin: EdgeInsets.symmetric(
//                                         horizontal: 8, vertical: 4),
//                                     padding: EdgeInsets.all(8),
//                                     decoration: BoxDecoration(
//                                       color: Color.fromARGB(255, 230, 228, 228),
//                                       borderRadius: BorderRadius.circular(24),
//                                     ),
//                                     child: ListTile(
//                                       leading: CircleAvatar(
//                                         backgroundColor: Colors.black,
//                                         child: Icon(Icons.person,
//                                             color: Colors.white),
//                                       ),
//                                       title: Text(doc['name']),
//                                       subtitle: Row(
//                                         children: [
//                                           Icon(Icons.star,
//                                               color: Colors.amber, size: 16),
//                                           SizedBox(width: 4),
//                                           Text('${doc['rating']}'),
//                                           // SizedBox(width: 8),
//                                           // Text('${doc['distance']} kms away'), // Uncomment this part when distance data is available
//                                         ],
//                                       ),
//                                       trailing: Icon(Icons.chat_bubble_outline),
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servease/category/electrician/elec_details.dart';
import 'package:servease/consts/consts.dart';
import 'package:servease/views/home/get_lat_long.dart';
import 'package:servease/widgets_common/location.dart';
import 'package:servease/widgets_common/navigationbar.dart';

class Elec extends StatefulWidget {
  const Elec({Key? key}) : super(key: key);

  @override
  State<Elec> createState() => _ElecState();
}

class _ElecState extends State<Elec> {
  String locality = "Unknown"; // Default locality
  Stream<QuerySnapshot>? _userStream;
  final LocationService locationService = LocationService();
  String error = "";
  TextEditingController searchController = TextEditingController();
  int _selectedIndex = 1; // Default to home screen

  @override
  void initState() {
    super.initState();
    getLatLong(); // Fetch location on init
  }

  void getLatLong() {
    locationService.determinePosition().then((position) {
      locationService
          .getLocality(position.latitude, position.longitude)
          .then((loc) {
        setState(() {
          locality = loc;
          print("Locality: $locality"); // Debugging line
          _getUserStream();
        });
      }).catchError((error) {
        setState(() {
          this.error = error.toString();
        });
      });
    }).catchError((error) {
      setState(() {
        this.error = error.toString();
      });
    });
  }

  void _getUserStream() async {
    setState(() {
      _userStream = FirebaseFirestore.instance
          .collection(locality) // Use the locality value as collection name
          .doc('1')
          .collection('elec')
          .snapshots();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Electricians Near You",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'uber', // Set your custom font family
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        centerTitle: true, // Center the title
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(
            color: Colors.black), // Change the app bar icon color to black
      ),
      body: Container(
        color: Colors.white,
        child: error.isNotEmpty
            ? Center(child: Text('Error: $error'))
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 235, 233, 233),
                              borderRadius: BorderRadius.circular(19.94),
                            ),
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(fontSize: 16),
                                contentPadding: EdgeInsets.all(6),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Color.fromARGB(255, 235, 233, 233),
                              ),
                              onChanged: (value) {
                                // Handle search functionality here
                                // Update the _userStream based on search query if needed
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/images/Adjust.png',
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {
                            // Handle filter button press
                            //   GetServerKey getServerkey = GetServerKey();
                            //   String accessToken =
                            //       await getServerkey.getServerKeyToken();
                            //   print(accessToken);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            label: Text('Sort'),
                            backgroundColor: Colors.grey[300],
                            shape: StadiumBorder(
                              side: BorderSide(
                                  color: Colors.grey[
                                      300]!), // Same as background color to remove border
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            label: Text('Nearest'),
                            backgroundColor: Colors.grey[300],
                            shape: StadiumBorder(
                              side: BorderSide(
                                  color: Colors.grey[
                                      300]!), // Same as background color to remove border
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            label: Text('Offers'),
                            backgroundColor: Colors.grey[300],
                            shape: StadiumBorder(
                              side: BorderSide(
                                  color: Colors.grey[
                                      300]!), // Same as background color to remove border
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            label: Text('Rating 4+'),
                            backgroundColor: Colors.grey[300],
                            shape: StadiumBorder(
                              side: BorderSide(
                                  color: Colors.grey[
                                      300]!), // Same as background color to remove border
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            label: Text('Previously'),
                            backgroundColor: Colors.grey[300],
                            shape: StadiumBorder(
                              side: BorderSide(
                                  color: Colors.grey[
                                      300]!), // Same as background color to remove border
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: _userStream == null
                        ? Center(child: CircularProgressIndicator())
                        : StreamBuilder(
                            stream: _userStream,
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Center(child: Text('Connection error'));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return Center(child: Text('No data available'));
                              }

                              print(
                                  "Documents: ${snapshot.data!.docs}"); // Debugging line

                              var docs = snapshot.data!.docs;
                              return ListView.builder(
                                itemCount: docs.length,
                                itemBuilder: (context, index) {
                                  var doc = docs[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ElecDetails(
                                            providerName: doc['name'] ?? "John doe",
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 230, 228, 228),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          child: Icon(Icons.person,
                                              color: Colors.white),
                                        ),
                                        title: Text(doc['name']),
                                        subtitle: Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.amber, size: 16),
                                            SizedBox(width: 4),
                                            Text('${doc['rating']}'),
                                            // SizedBox(width: 8),
                                            // Text('${doc['distance']} kms away'), // Uncomment this part when distance data is available
                                          ],
                                        ),
                                        trailing:
                                            Icon(Icons.message),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
