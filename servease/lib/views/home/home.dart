import 'package:firebase_auth/firebase_auth.dart';
import 'package:servease/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final User = FirebaseAuth.instance.currentUser;

  CollectionReference _referenceInfoList =
      FirebaseFirestore.instance.collection('contacts');
  late Stream<QuerySnapshot> _streamInfoItems;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();

    _streamInfoItems = _referenceInfoList.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    // _referenceInfoList.get();
    // _referenceInfoList.snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _streamInfoItems,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            // ignore: unused_local_variable
            QuerySnapshot querySnapshot = snapshot.data;
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => signout(),
        child: Icon(Icons.login_rounded),
      ),
    );
  }
}
