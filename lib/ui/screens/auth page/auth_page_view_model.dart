import 'package:stacked/stacked.dart';

class AuthPageViewModel extends BaseViewModel {
  final views=[];
  int index = 0;
  changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  init() {}
}
