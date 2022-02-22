// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/strings.dart';
import 'package:video_conference/app/validators.dart';
import 'package:video_conference/core/services/authentication_service.dart';
import 'package:video_conference/core/services/snackbar_service.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with Validators, SnackbarServiceHelper {
  AuthenticationService? _authenticationService =
      locator<AuthenticationService>();

  String emailError = '';

  bool isbusy = false;

  String? _email;
  String? get email => _email;

  bool get result => emailError.isEmpty;

  updateEmail(String email) {
    _email = email;
    emailError = validateEmail(email);
    notifyListeners();
  }

  void resetPassword() async {
    if (!result) {
      return null;
    }

    setBusy(true);
    isbusy = true;

    var resetPasswordResult =
        await _authenticationService!.resetPassword(email!);

    if (resetPasswordResult is String) {
      showErrorMessage(
        title: commonErrorTitle,
        message: commonErrorInfo,
      );
    } else {
      showSuccessMessage(
          title: successEmailSentTitle, message: successEmailSentInfo);
    }
    setBusy(false);
    isbusy = false;
  }
}
