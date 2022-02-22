// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:jitsi_meet/jitsi_meet.dart';

// Project imports:
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/core/model/create_meeting.dart';
import 'package:video_conference/core/services/firestore_service.dart';

import '../model/user.dart';

class JitsiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirestoreService _firestoreService = locator<FirestoreService>();
  joinMeeting(
      {required String roomNo,
      bool? videoMute,
      bool? audioMute,
      required CreateMeeting cm,
      bool? audioOnly,
      required String? userDisplayName,
      required String? email,
      bool isJoin = false,
      String? subject,
      String? profileImg}) async {
    try {
      Map<FeatureFlagEnum, bool> featureFlagEnum = {};
      featureFlagEnum[FeatureFlagEnum.WELCOME_PAGE_ENABLED] = true;
      featureFlagEnum[FeatureFlagEnum.MEETING_PASSWORD_ENABLED] = true;
      featureFlagEnum[FeatureFlagEnum.CHAT_ENABLED] = true;
      featureFlagEnum[FeatureFlagEnum.INVITE_ENABLED] = true;
      featureFlagEnum[FeatureFlagEnum.ADD_PEOPLE_ENABLED] = false;
      featureFlagEnum[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      featureFlagEnum[FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE] = true;

      var options = JitsiMeetingOptions(room: roomNo)
        ..subject = subject ?? "Meeting"
        ..userDisplayName = userDisplayName ?? ""
        ..audioOnly = audioOnly ?? false
        ..audioMuted = audioMute ?? false
        ..videoMuted = videoMute ?? true
        ..userEmail = email ?? ''
        ..featureFlags = featureFlagEnum;
      if (profileImg != null) {
        options.userAvatarURL = profileImg;
      }
      if (Platform.isAndroid) {
        featureFlagEnum[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        featureFlagEnum[FeatureFlagEnum.PIP_ENABLED] = false;
      }
      await JitsiMeet.joinMeeting(options,
          listener: JitsiMeetingListener(
              onConferenceWillJoin: (data) =>
                  _onConferenceWillJoin(data, cm, isJoin: isJoin),
              onConferenceJoined: _onConferenceJoined,
              onConferenceTerminated: _onConferenceTerminated,
              onPictureInPictureWillEnter: _onPictureInPictureWillEnter,
              onPictureInPictureTerminated: _onPictureInPictureTerminated,
              onError: _onError));
    } catch (error) {
      print("error: $error");
    }
  }

  _onConferenceWillJoin(Map<dynamic, dynamic> data, CreateMeeting cm,
      {bool isJoin = false}) {
    if (!isJoin) {
      _firestoreService.createMeeting(cm);
    }
    debugPrint("APPO _onConferenceWillJoin broadcasted");
  }

  _onConferenceJoined(Map<dynamic, dynamic> data) {
    debugPrint("APPO _onConferenceJoined broadcasted");
  }

  _onConferenceTerminated(Map<dynamic, dynamic> data) {
    debugPrint("APPO _onConferenceTerminated broadcasted");
  }

  _onPictureInPictureWillEnter(Map<dynamic, dynamic> data) {
    debugPrint("_onPictureInPictureWillEnter broadcasted with message: $data");
  }

  _onPictureInPictureTerminated(Map<dynamic, dynamic> data) {
    debugPrint(
        "APPO _onPictureInPictureTerminated broadcasted with message: $data");
  }

  _onError(error) {
    debugPrint("APPO _onError broadcasted:$error");
  }

  Future joinMeetingInFirebase(String code, User? user) async {
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
      joinMeeting(
          isJoin: true,
          roomNo: cm.roomId!,
          cm: cm,
          userDisplayName: user!.name,
          email: user.email);
    } else {
      // ! show snackbar
    }
  }
}
