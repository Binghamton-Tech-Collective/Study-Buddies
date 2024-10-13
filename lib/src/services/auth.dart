import "package:firebase_auth/firebase_auth.dart";

import "package:study_buddies/data.dart";
import "package:flutter/foundation.dart";

import "service.dart";

const googleID = "1001326048718-fe9njpjdfocdl8av3l60i60hv7esuj90.apps.googleusercontent.com";

class AuthService extends Service {
  late final FirebaseAuth firebase = FirebaseAuth.instance;

  @override
  Future<void> init() async {}

  @override
  Future<void> dispose() async {}

  Future<void> signOut() async {
    await firebase.signOut();
  }

  Future<void> signIn() async {
    final google = GoogleAuthProvider().setCustomParameters({"hd": "binghamton.edu", "promt": "select_account"});
    if(kIsWeb) {
      await firebase.signInWithPopup(google);
    } else {
      await firebase.signInWithProvider(google);
    }
  }

  User? get user => firebase.currentUser;

  // UserID? get userID => user == null ? null : UserID(user!.uid);
  
}
