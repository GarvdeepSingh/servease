import 'package:firebase_auth/firebase_auth.dart';
import 'package:servease/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:servease/main.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final User = FirebaseAuth.instance.currentUser;

  //document IDs
  List<String> docIDs = [];

//get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('Pitampura')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docIDs.add(element.reference.id);
            }));
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: Center(
          // child: Text('${User!.email}'),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => signout(),
        child: const Icon(Icons.login_rounded),
      ),
    );
  }
}
