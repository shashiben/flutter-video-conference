// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/strings.dart';
import 'package:video_conference/app/validators.dart';
import 'package:video_conference/core/services/snackbar_service.dart';
import 'package:video_conference/ui/screens/create%20profile/create_profile_view.dart';

class SignUpViewModel extends BaseViewModel
    with Validators, SnackbarServiceHelper {
  final NavigationService _navigationService = locator<NavigationService>();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();

  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';

  bool get result =>
      emailError.isEmpty &&
      passwordError.isEmpty &&
      confirmPasswordError.isEmpty;

  updateEmail() {
    emailError = validateEmail(emailController.text);
  }

  updatePassword() {
    passwordError = validatePassword(passController.text);
  }

  updateConfirmPassword() {
    confirmPasswordError = validatePassword(confirmpassController.text);
  }

  signup() async {
    if (!result) {
      return null;
    }

    if (passController.text.compareTo(confirmpassController.text) == 1) {
      showInfoMessage(
        title: commonErrorTitle,
        message: passwordMatchErrorInfo,
      );

      return null;
    }

    setBusy(true);
    navigateToCreateProfile();

    setBusy(false);
  }

  navigateToCreateProfile() {
    _navigationService.navigateWithTransition(
        CreateProfile(
            email: emailController.text, password: passController.text),
        transition: "rotate");
  }
}
