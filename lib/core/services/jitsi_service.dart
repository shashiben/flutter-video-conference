import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class JitsiService {
  joinMeeting({@required String roomNo}) async {
    try {
      Map<FeatureFlagEnum, bool> featureFlagEnum = {};
      featureFlagEnum[FeatureFlagEnum.WELCOME_PAGE_ENABLED] = true;
      featureFlagEnum[FeatureFlagEnum.MEETING_PASSWORD_ENABLED] = true;
      featureFlagEnum[FeatureFlagEnum.CHAT_ENABLED] = true;

      var options = JitsiMeetingOptions(room: roomNo)
        ..subject = "Meeting with Gunschu"
        ..userDisplayName = "My Name"
        ..audioOnly = true
        ..audioMuted = true
        ..videoMuted = true
        ..featureFlags = featureFlagEnum;
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
