import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/router.gr.dart';

class HomeScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  navigateToChat() {
    _navigationService.navigateTo(Routes.chatScreenRoute);
  }
}
