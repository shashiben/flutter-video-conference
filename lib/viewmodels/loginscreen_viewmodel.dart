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

  String _email = '';
  String get email => _email;
  String _password = '';
  String get password => _password;

  String emailError = '';
  String passwordError = '';

  bool _check;
  bool get check => _check;

  checkTap() {
    _check = !_check;
    notifyListeners();
  }

  login() async {
    bool result = emailError.isEmpty && passwordError.isEmpty;

    result = result && _email.isNotEmpty && _password.isNotEmpty;

    if (!result) {
      showInfoMessage(
          title: commonErrorTitle,
          message: "Please check your details and try again");

      return;
    }

    setBusy(true);

    var authResult = await _authenticationService.login(
      email: _email,
      password: _password,
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

  updateEmail(String email) {
    _email = email;
    emailError = validateEmail(email);
    notifyListeners();
  }

  updatePassword(String password) {
    _password = password;
    passwordError = validatePassword(password);

    notifyListeners();
  }

  init() {
    _check = false;
  }
}
