// import 'dart:math';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:googlesign_in/home.dart';
//
// class GoogleSignin extends StatefulWidget {
//   const GoogleSignin({Key? key}) : super(key: key);
//
//   @override
//   State<GoogleSignin> createState() => _GoogleSigninState();
// }
//
// class _GoogleSigninState extends State<GoogleSignin> {
//   Future<User?> signInWithGoogle() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//
//     final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//
//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//
//       try {
//         final UserCredential userCredential =
//         await auth.signInWithCredential(credential);
//
//       //  user = userCredential.user;
// // log(userCredential.user.toString()),
//         if (userCredential.user != null) {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => HomePage()));
//         }
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           print(e.code);
//         } else if (e.code == 'invalid-credential') {
//           print(e.code);
//         }
//       } catch (e) {
//         print(e.toString());
//       }
//     }
//
//     return user;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: MaterialApp(
//           home: Scaffold(
//             body: Center(
//               child: InkWell(
//                 onTap: () {
//                   signInWithGoogle();
//                 },
//                 child: const Text(
//                   'Tap to google sign in:',
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }
import 'dart:developer';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlesign_in/home.dart';

class GoogleSignin extends StatefulWidget {
  const GoogleSignin({Key? key}) : super(key: key);

  @override
  State<GoogleSignin> createState() => _GoogleSigninState();
}

class _GoogleSigninState extends State<GoogleSignin> {
  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        // user = userCredential.user;
        log('user = ${userCredential.user.toString()}');
        if (userCredential.user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print(e.code);
        } else if (e.code == 'invalid-credential') {
          print(e.code);
        }
      } catch (e) {
        print(e.toString());
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: InkWell(
                onTap: () {
                  signInWithGoogle();
                },
                child: const Text(
                  'Tap to google sign in:',
                ),
              ),
            ),
          ),
        ));
  }
}