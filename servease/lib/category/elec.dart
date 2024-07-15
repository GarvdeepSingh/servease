// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geolocator/geolocator.dart';
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
//         title: Text("Elec"),
//       ),
//       body: error.isNotEmpty
//           ? Center(child: Text('Error: $error'))
//           : _userStream == null
//               ? Center(child: CircularProgressIndicator())
//               : StreamBuilder(
//                   stream: _userStream,
//                   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (snapshot.hasError) {
//                       return Center(child: Text('Connection error'));
//                     }
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     }
//                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                       return Center(child: Text('No data available'));
//                     }

//                     print(
//                         "Documents: ${snapshot.data!.docs}"); // Debugging line

//                     var docs = snapshot.data!.docs;
//                     return ListView.builder(
//                       itemCount: docs.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           leading: Icon(Icons.person),
//                           title: Text(docs[index]['name']),
//                           subtitle: Text('${docs[index]['rating']}'),
//                         );
//                       },
//                     );
//                   },
//                 ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:servease/widgets_common/location.dart'; // Ensure the path is correct

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on,
                color: const Color.fromARGB(
                    255, 255, 0, 0)), // Set icon color to red
            SizedBox(width: 8),
            Text(
              error.isEmpty ? locality : "Error",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18, color: Colors.black, fontFamily: 'uber'),
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
      ),
      body: error.isNotEmpty
          ? Center(child: Text('Error: $error'))
          : _userStream == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(fontSize: 16),
                                contentPadding: EdgeInsets.all(6),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Color(0xFFEEEEEE),
                              ),
                              onChanged: (value) {
                                // Handle search functionality here
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.sort, color: Colors.black),
                            onPressed: () {
                              // Handle sort functionality here
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FilterChipWidget(label: 'Nearest'),
                          FilterChipWidget(label: 'Offers'),
                          FilterChipWidget(label: 'Rating 4+'),
                          FilterChipWidget(label: 'Previously'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder(
                        stream: _userStream,
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Center(child: Text('Connection error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Center(child: Text('No data available'));
                          }

                          var docs = snapshot.data!.docs;
                          return ListView.builder(
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              var doc = docs[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                                title: Text(doc['name']),
                                subtitle: Text(
                                    '${doc['rating']} \u2605'), // Removed distance
                                trailing: Icon(Icons.chat),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;

  const FilterChipWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      onSelected: (bool value) {
        // Add filter functionality here
      },
    );
  }
}
