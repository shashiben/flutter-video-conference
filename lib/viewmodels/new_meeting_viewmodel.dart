import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/icons.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/model/create_meeting/createMeeting.dart';
import 'package:video_conference/model/user/user.dart';
import 'package:video_conference/services/authentication_service.dart';
import 'package:video_conference/services/firestore_service.dart';
import 'package:video_conference/services/user_service.dart';

class NewMeetingViewModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthenticationService _authService = locator<AuthenticationService>();
  final UserService _userService = locator<UserService>();
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

  validate({title, password, private}) async {
    print("P and t is:" + password + title);
    setBusy(true);
    if (title != "" && password != "") {
      CreateMeeting cm = CreateMeeting(
          title: title,
          name: _user.name,
          password: password,
          timeStamp: DateTime.now(),
          uid: uid,
          image: _user.image,
          appID: "",
          audio: muteAudio,
          video: muteVideo,
          private: private);
      print("created cm:" + cm.toString());
      bool res = await _firestoreService.createMeeting(cm);
      print("Got response after firestore service:" + res.toString());
      if (res) {
      } else {
        _snackbarService.showCustomSnackBar(
            duration: Duration(seconds: 5),
            message: "Please try again!!",
            icon: Icon(FlutterIcons.error_mdi),
            title: "Error occured");
      }
    } else {
      print("Empty title");
      _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          message: "Title and password shouldn\'t be empty",
          icon: Icon(infoIcon),
          title: "Please fill the details");
    }
    setBusy(false);
  }

  init() async {
    uid = await _authService.getUid();
    _user = await _userService.getUserdata(uid);
    print(_user.image);
  }
}
