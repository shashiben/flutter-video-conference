import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/core/model/user.dart';
import 'package:video_conference/core/model/create_meeting.dart';
import 'package:video_conference/core/services/authentication_service.dart';
import 'package:video_conference/core/services/jitsi_service.dart';
import 'package:video_conference/core/utils/user_state_enum.dart';
import 'package:video_conference/core/utils/user_utilities.dart';

@lazySingleton
class FirestoreService {
  final JitsiService _jitsiService = JitsiService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future<bool> isUserExists(String uid) async {
    var data = await _firestore.collection("users").doc(uid).get();
    if (data.data() != null) {
      return true;
    }
    return false;
  }

  Future<List<User>> fetchAllUsers() async {
    List<User> userList = [];

    QuerySnapshot querySnapshot = await _firestore.collection("users").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i].id != _authenticationService.getUid()) {
        userList.add(User.fromMap(querySnapshot.docs[i].data()));
      }
    }
    return userList;
  }

  Future<bool> addUserData(String uid, User userModel) async {
    try {
      await _firestore.collection("users").doc(uid).set(User.toMap(userModel));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future getuserDetails() async {
    try {
      var data = await _firestore
          .collection("users")
          .doc(_authenticationService.getUid())
          .get();
      return User.fromMap(data.data());
    } catch (e) {}
  }

  Future<User> getUserDetailsById(id) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection("users").doc(id).get();
      return User.fromMap(documentSnapshot.data());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future updateProfile(Map<String, dynamic> json, String uid) async {
    await _firestore.collection("users").doc(uid).update(json);
  }

  Future<void> setUserState(
      {@required String userId, @required UserState userState}) async {
    int stateNum = UserUtils.stateToNum(userState);

    await _firestore.collection("users").doc(userId).update({
      "state": stateNum,
    });
  }

  Future createMeeting(CreateMeeting cm) async {
    await _firestore
        .collection("meetings")
        .doc(cm.timeStamp)
        .set(CreateMeeting.toJson(cm));
  }

  Future joinMeeting(String code, User user) async {
    var data = await _firestore
        .collection("meetings")
        .where("code", isEqualTo: code)
        .get();
    bool kim = false;
    if (data.docs.length != 0) {
      print(data.docs);
      if (data.docs[0].data()["endAt"] == null) {
        kim = true;
      } else if (int.parse(data.docs[0].data()["endAt"].toString()) >=
          DateTime.now().millisecondsSinceEpoch) kim = true;
    }
    if (kim) {
      CreateMeeting cm = CreateMeeting.fromMap(data.docs[0].data());
      _jitsiService.joinMeeting(
          isJoin: true,
          roomNo: cm.roomId,
          cm: cm,
          userDisplayName: user.name,
          email: user.email);
    } else {
      // ! show snackbar
    }
  }

  Stream<DocumentSnapshot> getUserStream({@required String uid}) =>
      _firestore.collection("users").doc(uid).snapshots();
}
