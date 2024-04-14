import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:servease/consts/consts.dart';
import 'package:servease/views/auth/login.dart';
import 'package:servease/views/home/home.dart';

class mywrapper extends StatefulWidget {
  const mywrapper({super.key});

  @override
  State<mywrapper> createState() => _mywrapperState();
}

class _mywrapperState extends State<mywrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: ((context, snapshot) {
        if(snapshot.hasData){
          return homepage();
        }else{
          return loginpage();
        }
      })),
    );
  }
}