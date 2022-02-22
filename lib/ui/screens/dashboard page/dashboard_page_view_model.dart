// Package imports:
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/ui/screens/create%20meeting/create_meeting.dart';
import 'package:video_conference/ui/screens/join%20meeting/join_meeting.dart';

class DashboardPageViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  int index = 0;
  navigateToCreateMeeting() {
    _navigationService.navigateWithTransition(CreateMeetingView(),
        transition: "rightToLeftWithFade");
  }

  navigateToJoinMeeting() {
    _navigationService.navigateWithTransition(JoinMeetingView(),
        transition: "rightToLeftWithFade");
  }

  changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
