import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/router.gr.dart';
import 'package:video_conference/app/strings.dart';
import 'package:video_conference/app/validators.dart';
import 'package:video_conference/services/authentication_service.dart';
import 'package:video_conference/services/snackbarservices.dart';

class LoginScreenViewModel extends BaseViewModel
    with Validators, SnackbarServiceHelper {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  String emailError = '';
  String passwordError = '';

  bool _check;
  bool get check => _check;

  checkTap() {
    _check = !_check;
    notifyListeners();
  }

  mailValid() {
    if (emailController.text != "") {
      emailError = validateEmail(emailController.text);
      notifyListeners();
    }
  }

  passValid() {
    if (passController.text != "") {
      passwordError = validatePassword(passController.text);
      notifyListeners();
    }
  }

  login() async {
    bool result = emailError.isEmpty && passwordError.isEmpty;

    result = result &&
        emailController.text.isNotEmpty &&
        passController.text.isNotEmpty;

    if (!result) {
      showInfoMessage(
          title: commonErrorTitle,
          message: "Please check your details and try again");

      return;
    }

    setBusy(true);

    var authResult = await _authenticationService.login(
      email: emailController.text,
      password: passController.text,
    );

    setBusy(false);

    if (authResult is bool && authResult) {
      navigateToDashboard();
    } else {
      showErrorMessage(
        title: commonErrorTitle,
        message: commonErrorInfo,
      );
    }
  }

  navigateToDashboard() {
    _navigationService.navigateTo(Routes.dashboardRoute);
  }

  init() {
    _check = false;
  }
}
