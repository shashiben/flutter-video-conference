// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'package:video_conference/ui/screens/forgot%20password/forgot_page.dart';
import 'package:video_conference/ui/screens/login%20page/login_page.dart';
import 'package:video_conference/ui/screens/signup%20page/signup_page.dart';

class AuthPageViewModel extends BaseViewModel {
  final views = [LoginScreen(), SignupPage(), ForgotPage()];
  int index = 0;
  changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  init() {}
}
