import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  late FirebaseAuth _auth;
  bool _authenticated = false;
  bool get authenticated => _authenticated;
  User? get user => _auth.currentUser;

  AuthProvider() {
    _auth = FirebaseAuth.instance;

    _auth.authStateChanges().listen(onAuthStateChanged);
  }

  Future<void> onAuthStateChanged(User? user) async {
    if (user == null) {
      _authenticated = false;
    } else {
      _authenticated = true;
    }
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on Exception catch (e) {
      print("COULD NOT SIGN OUT");
      print(e);
    }
    notifyListeners();
  }
}
