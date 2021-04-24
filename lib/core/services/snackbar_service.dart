import 'dart:io';

import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/strings.dart';

class SnackbarServiceHelper {
  final SnackbarService _snackbarService = locator<SnackbarService>();

  Future<bool> showExitSnackbar() async {
    await _snackbarService.showCustomSnackBar(
      title: confirmExitInfo,
      duration: Duration(seconds: 5),
      message: confirmExitMessage,
      onMainButtonTapped: () => exit(0),
      mainButtonTitle: ("Yes"),
    );

    return false;
  }

  showInfoMessage({String title, String message}) async {
    _snackbarService.showCustomSnackBar(
      title: title,
      duration: Duration(seconds: 5),
      message: message,
    );
  }

  showErrorMessage({String title, String message}) async {
    _snackbarService.showCustomSnackBar(
      title: title,
      duration: Duration(seconds: 5),
      message: message,
    );
  }

  showSuccessMessage({String title, String message}) async {
    _snackbarService.showCustomSnackBar(
      title: title,
      duration: Duration(seconds: 5),
      message: message,
    );
  }
}
