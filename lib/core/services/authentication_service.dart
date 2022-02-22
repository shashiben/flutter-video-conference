// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/ui/screens/auth%20page/auth_page.dart';

@lazySingleton
class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final NavigationService? _navigationService = locator<NavigationService>();

  Future login({required email, required password}) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (e) {}
  }

  bool isUserLoggedIn() {
    var user = _auth.currentUser;
    return user != null;
  }

  Future signOut() async {
    await _auth.signOut();
    _navigationService!.clearTillFirstAndShowView(AuthPage());
  }

  Future<String?> resetPassword(String email) async {
    String? reset;
    try {
      await _auth.sendPasswordResetEmail(email: email).catchError((e) {
        reset = e.toString();
      });
    } catch (e) {
      reset = e.toString();
    }
    return reset;
  }

  Future signup({required email, required password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return e.toString();
    }
  }

  String? getUid() {
    var user = _auth.currentUser;
    return user != null ? user.uid : null;
  }
}
