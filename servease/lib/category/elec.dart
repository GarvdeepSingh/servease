import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:servease/widgets_common/location.dart'; // Import the location service

class Elec extends StatefulWidget {
  const Elec({Key? key}) : super(key: key);

  @override
  State<Elec> createState() => _ElecState();
}

class _ElecState extends State<Elec> {
  String address = "Vishnu Garden"; // Default address
  Stream<QuerySnapshot>? _userStream;
  final LocationService locationService = LocationService();
  String error = "";
  late String collection;

  @override
  void initState() {
    super.initState();
    getLatLong(); // Fetch location on init
  }

  void getLatLong() {
    locationService.determinePosition().then((position) {
      locationService.getAddress(position.latitude, position.longitude).then((addr) {
        setState(() {
          address = addr; // Update address variable
          _getUserStream(); // Fetch Firestore data based on updated address
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
    try {
      Position position = await locationService.determinePosition();
      collection = await locationService.getCollectionBasedOnLocation(position.latitude, position.longitude);

      setState(() {
        _userStream = FirebaseFirestore.instance
            .collection(address) // Use updated address here
            .doc('1')
            .collection('elec')
            .snapshots();
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Elec"),
      ),
      body: error.isNotEmpty
          ? Center(child: Text('Error: $error'))
          : _userStream == null
              ? Center(child: CircularProgressIndicator())
              : StreamBuilder(
                  stream: _userStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Connection error'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No data available'));
                    }
                    var docs = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.person),
                          title: Text(docs[index]['name']),
                          subtitle: Text('${docs[index]['rating']}'),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
