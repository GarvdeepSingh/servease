import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:servease/consts/consts.dart';
import 'package:servease/views/auth/forgot.dart';
import 'package:servease/views/auth/signup.dart';
import 'package:servease/views/google_auth/sign_in.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginState();
}

class _loginState extends State<loginpage> {

  TextEditingController email=TextEditingController();
  TextEditingController passwaord=TextEditingController();

  signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: passwaord.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login"),),
      body: Padding(

        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'enter email'),
            ),
            TextField(
              controller: passwaord,
              decoration: InputDecoration(hintText: 'password'),
            ),

            ElevatedButton(onPressed: (()=>signin()), child: Text('login')),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (()=>Get.to(() =>mysignup())), child: Text('register now')),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (()=>Get.to(() =>forgot())), child: Text('forgot password')),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (()=>Get.to(() =>google())), child: Text('google')),
          ],
        ),
      ),

    );
  }
}