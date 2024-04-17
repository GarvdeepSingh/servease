import 'package:firebase_auth/firebase_auth.dart';
import 'package:servease/consts/consts.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  final User=FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home page"),),
      body: Center(child: Text('${User!.email}'),),

      floatingActionButton: FloatingActionButton(onPressed: ()=>signout(),
      child: const Icon(Icons.login_rounded),),
    );
  }
}