import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login({@required email, @required password}) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (e) {}
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _auth.currentUser();
    return user != null;
  }

  Future signOut() async {
    await _auth.signOut();
  }

  Future signup({@required email, @required password}) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (e) {}
  }
}
