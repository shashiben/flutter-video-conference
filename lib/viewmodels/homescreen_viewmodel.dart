import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/router.gr.dart';

class HomeScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  navigateToChat() {
    _navigationService.navigateTo(Routes.chatScreenRoute);
  }

  navigateToNewMeeting() {
    _navigationService.navigateTo(Routes.newMeetingRoute);
  }

  navigateToJoinMeeting() {
    _navigationService.navigateTo(Routes.joinMeetingRoute);
  }

  navigateToSchedule() {
    _navigationService.navigateTo(Routes.scheduleRoute);
  }

  navigateToPublic() {
    _navigationService.navigateTo(Routes.publicMeetingsRoute);
  }
}
