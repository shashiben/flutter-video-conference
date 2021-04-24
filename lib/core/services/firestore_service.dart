import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:video_conference/core/model/user.dart';

@lazySingleton
class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<bool> isUserExists(String uid) async {
    var data = await _firestore.collection("users").doc(uid).get();
    if (data.data() != null) {
      return true;
    }
    return false;
  }

  Future<bool> addUserData(String uid, User userModel) async {
    try {
      await _firestore.collection("users").doc(uid).set(User.toMap(userModel));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future updateProfile(Map<String, dynamic> json, String uid) async {
    await _firestore.collection("users").doc(uid).update(json);
  }
}
