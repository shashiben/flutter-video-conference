import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/strings.dart';
import 'package:video_conference/app/validators.dart';
import 'package:video_conference/core/services/snackbar_service.dart';

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
    notifyListeners();
  }

  updatePassword() {
    passwordError = validatePassword(passController.text);
    notifyListeners();
  }

  updateConfirmPassword() {
    confirmPasswordError = validatePassword(confirmpassController.text);
    notifyListeners();
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
    // _navigationService.navigateTo(Routes.createProfileRoute,
    //     arguments: CreateProfileArguments(
    //         email: emailController.text, password: passController.text));
  }
}
