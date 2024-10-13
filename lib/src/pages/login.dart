import "package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart";
import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:fluttertoast/fluttertoast.dart";
import "package:study_buddies/data.dart";
import "package:study_buddies/services.dart";


class LoginPage extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // Show success toast
    await Fluttertoast.showToast(
      msg: "Sign in successful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
    );

    return userCredential;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: Center(
        child: GoogleSignInButton(
          onTap: () async {
            try {
              await signInWithGoogle();
            } catch (e) {
              scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(content: Text("Sign in failed: $e")));
            }
          }, 
          loadingIndicator: const CircularProgressIndicator(), 
          clientId: googleID,
        ),
      ),
    );
}
