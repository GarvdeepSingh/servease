import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:servease/widgets_common/location.dart'; // Import the location service

class Elec extends StatefulWidget {
  const Elec({super.key});

  @override
  State<Elec> createState() => _ElecState();
}

class _ElecState extends State<Elec> {
  String address = "";
  Stream<QuerySnapshot>? _userStream;
  final LocationService locationService = LocationService();
  String error = "";
  late String collection;

  @override
  void initState() {
    super.initState();
    _getUserStream();
  }

  void _getUserStream() async {
    try {
      // Get the user's position
      Position position = await locationService.determinePosition();
      // Get the locality based on the user's position
      address = await locationService.getCollectionBasedOnLocation(
          position.latitude, position.longitude);

      setState(() {
        // Use the locality as the collection name
        _userStream = FirebaseFirestore.instance
            .collection(address)
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
        title: Text("elec"),
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
