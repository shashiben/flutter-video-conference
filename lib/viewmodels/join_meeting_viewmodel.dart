import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/icons.dart';
import 'package:video_conference/app/locator.dart';

class JoinMeetingViewModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  bool muteVideo = false;
  bool muteAudio = false;

  changeVideo() {
    muteVideo = !muteVideo;
    notifyListeners();
  }

  changeAudio() {
    muteAudio = !muteAudio;
    notifyListeners();
  }

  validate({title, password}) {
    if (title != "" && password != "") {
    } else {
      _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          message: "Title and password shouldn\'t be empty",
          icon: Icon(infoIcon),
          title: "Please fill the details");
    }
  }
}
