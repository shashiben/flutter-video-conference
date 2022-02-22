// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/core/model/create_meeting.dart';
import 'package:video_conference/core/model/user.dart';
import 'package:video_conference/core/services/authentication_service.dart';
import 'package:video_conference/core/services/firestore_service.dart';
import 'package:video_conference/core/services/jitsi_service.dart';

class CreateMeetingViewModel extends BaseViewModel {
  final TextEditingController titleController = TextEditingController();
  JitsiService _jitsiService = JitsiService();
  String code = "";

  generateNewCode() {
    code = random(100000000, 999999999).toString();
    String ran = '';
    for (int i = 1; i < code.length + 1; i++) {
      ran += code[i - 1];
      if (i % 3 == 0 && i != code.length) {
        ran += " - ";
      }
    }
    code = ran;

    notifyListeners();
  }

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  joinMeeting() {
    Uuid uuid = Uuid();

    String randomId = uuid.v4();
    while (_user == null) {}
    CreateMeeting cm = CreateMeeting(
        name: _user!.name,
        roomId: randomId,
        code: code,
        timeStamp: DateTime.now().millisecondsSinceEpoch.toString(),
        uid: _user!.uid);
    _jitsiService.joinMeeting(
        roomNo: randomId,
        email: _user!.email,
        userDisplayName: _user!.name,
        audioMute: muteAudio,
        videoMute: muteVideo,
        cm: cm);
  }

  //final SnackbarService _snackbarService = locator<SnackbarService>();
  final FirestoreService? _firestoreService = locator<FirestoreService>();
  final AuthenticationService? _authService = locator<AuthenticationService>();
  bool muteVideo = false;
  bool muteAudio = false;
  String? uid;

  User? _user;

  changeVideo() {
    muteVideo = !muteVideo;
    notifyListeners();
  }

  changeAudio() {
    muteAudio = !muteAudio;
    notifyListeners();
  }

  init() async {
    uid = _authService!.getUid();
    _user = await _firestoreService!.getUserDetailsById(uid);
    generateNewCode();
  }
}
