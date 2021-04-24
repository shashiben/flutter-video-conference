import 'package:stacked/stacked.dart';

class DashboardPageViewModel extends BaseViewModel {
  int index = 0;
  changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
