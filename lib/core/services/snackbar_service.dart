// Dart imports:
import 'dart:io';

// Package imports:
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/snackbar_ui.dart';
import 'package:video_conference/app/strings.dart';

class SnackbarServiceHelper {
  final SnackbarService? _snackbarService = locator<SnackbarService>();

  Future<bool> showExitSnackbar() async {
    await _snackbarService!.showCustomSnackBar(
      title: confirmExitInfo,
      variant: SnackbarType.floating,
      duration: Duration(seconds: 5),
      message: confirmExitMessage,
      onMainButtonTapped: () => exit(0),
      mainButtonTitle: ("Yes"),
    );

    return false;
  }

  showInfoMessage({String? title, required String message}) async {
    _snackbarService!.showCustomSnackBar(
      title: title,
      variant: SnackbarType.floating,
      duration: Duration(seconds: 5),
      message: message,
    );
  }

  showErrorMessage({String? title, required String message}) async {
    _snackbarService!.showCustomSnackBar(
      title: title,
      variant: SnackbarType.floating,
      duration: Duration(seconds: 5),
      message: message,
    );
  }

  showSuccessMessage({String? title, required String message}) async {
    _snackbarService!.showCustomSnackBar(
      title: title,
      variant: SnackbarType.floating,
      duration: Duration(seconds: 5),
      message: message,
    );
  }
}
