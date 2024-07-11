<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> parent of 99888aa (Merge branch 'main' of https://github.com/GarvdeepSingh/servease)
// import 'package:firebase_auth/firebase_auth.dart';
// // ignore: unused_import
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class google extends StatelessWidget {
//   const google({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             signInWithGoogle();
//           },
//           child: const Text('Google sign-up'),
//         ),
//       ),
//     );
//   }

//   signInWithGoogle() async {
//     GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//     AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );

//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);

//     print(userCredential.user?.displayName);
//   }
// }

<<<<<<< HEAD
>>>>>>> parent of d846b4b (ui)
=======
>>>>>>> parent of 99888aa (Merge branch 'main' of https://github.com/GarvdeepSingh/servease)
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:servease/widgets_common/skipscreen/slider_screen1.dart';

class google extends StatelessWidget {
  const google({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signInWithGoogle(context);
          },
          child: const Text('Google sign-up'),
        ),
      ),
    );
  }

  signInWithGoogle(BuildContext context) async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCredential.user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    }

    print(userCredential.user?.displayName);
  }
}
