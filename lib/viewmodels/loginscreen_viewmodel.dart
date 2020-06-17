import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/router.gr.dart';

class LoginScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  bool _check;
  bool get check => _check;

  checkTap() {
    print("At check:" + _check.toString());
    _check = !_check;
    notifyListeners();
  }

  navigateToDashboard() {
    _navigationService.navigateTo(Routes.dashboardRoute);
  }

  init() {
    _check = false;
  }
}
