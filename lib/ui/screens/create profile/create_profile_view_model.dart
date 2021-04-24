import 'package:stacked/stacked.dart';

class CreateProfileViewModel extends BaseViewModel {
  String email, password;
  init(String e, String p) {
    email = e;
    password = p;
    notifyListeners();
  }
}
