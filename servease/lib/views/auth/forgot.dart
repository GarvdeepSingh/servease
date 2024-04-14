import 'package:firebase_auth/firebase_auth.dart';
import 'package:servease/consts/consts.dart';
// ignore: unused_import
import 'package:servease/consts/strings.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {

  TextEditingController email=TextEditingController();
  

  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("forgot pasword"),),
      body: Padding(

        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'enter email'),
            ),


            ElevatedButton(onPressed: (()=>reset()), child: Text('send link'))
          ],
        ),
      ),

    );
  }
}