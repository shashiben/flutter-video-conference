import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/core/model/user.dart';
import 'package:video_conference/core/services/authentication_service.dart';
import 'package:video_conference/core/services/firestore_service.dart';
import 'package:video_conference/core/services/jitsi_service.dart';

class JoinMeetingViewModel extends BaseViewModel {
  final TextEditingController titleController = TextEditingController();
  JitsiService _jitsiService = JitsiService();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  joinMeeting() async {
    bool res = await _firestoreService.joinMeeting(titleController.text);
    print(res);
  }

  //final SnackbarService _snackbarService = locator<SnackbarService>();
  final AuthenticationService _authService = locator<AuthenticationService>();
  bool muteVideo = false;
  bool muteAudio = false;
  String uid;

  User _user;

  changeVideo() {
    muteVideo = !muteVideo;
    notifyListeners();
  }

  changeAudio() {
    muteAudio = !muteAudio;
    notifyListeners();
  }

  init() async {
    uid = _authService.getUid();
    _user = await _firestoreService.getUserDetailsById(uid);
  }
}
