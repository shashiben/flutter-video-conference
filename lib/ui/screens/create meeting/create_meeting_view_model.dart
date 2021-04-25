import 'package:stacked/stacked.dart';
import 'package:video_conference/core/services/jitsi_service.dart';

class CreateMeetingViewModel extends BaseViewModel {
  JitsiService _jitsiService = JitsiService();
  String code = "";

  joinMeeting() {
    _jitsiService.joinMeeting(roomNo: "roomNo");
  }

  init() {}
}
