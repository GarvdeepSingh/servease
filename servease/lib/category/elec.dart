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
      appBar: AppBar(
        title: Text("Elec"),
      ),
      body: error.isNotEmpty
          ? Center(child: Text('Error: $error'))
          : _userStream == null
              ? Center(child: CircularProgressIndicator())
              : StreamBuilder(
                  stream: _userStream,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Connection error'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No data available'));
                    }

                    print(
                        "Documents: ${snapshot.data!.docs}"); // Debugging line

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
