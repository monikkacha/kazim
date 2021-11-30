import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:project_beta/src/common_widgets/snackbars.dart';

class GoogleAuthentication {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<void> singOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Snackbars.showTextSnackBar(
          text: "Error signing out. Try again.", context: context);
    }
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    print("got into method");
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    print("got singed in account");

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      print("got auth credentials");

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        print("got user credentials");

        user = userCredential.user;

        print("got user ");

        Snackbars.showTextSnackBar(
            text: "User logined successfully", context: context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Snackbars.showTextSnackBar(
              text: "The account already exists with a different credential",
              context: context);
        } else if (e.code == 'invalid-credential') {
          Snackbars.showTextSnackBar(
              text: "Error occurred while accessing credentials. Try again.",
              context: context);
        }
      } catch (e) {
        Snackbars.showTextSnackBar(
            text: "Error occurred using Google Sign In. Try again.",
            context: context);
      }

      return user;
    }
  }

  static Future<List<dynamic>> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (user != null) {
        return [true, user.uid];
      } else {
        return [false];
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      String msg = e.message!;
      // if (e.code == "firebase_auth/email-already-in-use") {
      //   msg = "provided email is already in use";
      // } else if (e.code == "firebase_auth/invalid-email") {
      //   msg = "invalid email provided";
      // }
      if (msg.isEmpty) {
        msg =
            "there is some issue with your email and password , please check and try again";
      }
      return [false, msg];
    }
  }

  static Future<bool> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }
}
