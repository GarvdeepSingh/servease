import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:servease/consts/consts.dart';
import 'package:servease/views/auth/wrapper.dart';

class mysignup extends StatefulWidget {
  const mysignup({super.key});

  @override
  State<mysignup> createState() => _signupState();
}

class _signupState extends State<mysignup> {

  TextEditingController email=TextEditingController();
  TextEditingController passwaord=TextEditingController();

  signun() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: passwaord.text);
    Get.offAll(mywrapper());
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("signup"),),
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

            ElevatedButton(onPressed: (()=>mysignup()), child: Text('signup'))
          ],
        ),
      ),

    );
  }
}