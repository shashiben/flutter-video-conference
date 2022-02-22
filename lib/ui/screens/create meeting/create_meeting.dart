// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_icons/flutter_icons.dart';

// Project imports:
import 'package:video_conference/app/colors.dart';
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/create%20meeting/create_meeting_view_model.dart';
import 'package:video_conference/ui/widgets/inputField.dart';

class CreateMeetingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
        onModelReady: (dynamic m) => m.init(),
        viewModel: CreateMeetingViewModel(),
        builder: (context, uiHelpers, CreateMeetingViewModel model) => Scaffold(
              body: Container(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Create Meeting"),
                    centerTitle: true,
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                          leading: Icon(
                              !model.muteVideo
                                  ? FlutterIcons.video_off_mco
                                  : FlutterIcons.video_fou,
                              color: Colors.white),
                          title: Text(
                            "Mute My Videos",
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: CupertinoSwitch(
                              trackColor: surfaceColor,
                              activeColor: primaryColor,
                              value: model.muteVideo,
                              onChanged: (c) => model.changeVideo())),
                      ListTile(
                          leading: Icon(
                              model.muteAudio
                                  ? FlutterIcons.volume_high_mco
                                  : FlutterIcons.mute_oct,
                              color: Colors.white),
                          title: Text(
                            "Mute My Voices",
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: CupertinoSwitch(
                              trackColor: surfaceColor,
                              activeColor: primaryColor,
                              value: model.muteAudio,
                              onChanged: (c) => model.changeAudio())),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${model.code}",
                                style: uiHelpers.body!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(38, 50, 56, 0.30),
                                )),
                            IconButton(
                                icon: Icon(FlutterIcons.refresh_sli),
                                onPressed: () => model.generateNewCode())
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: InputField(
                          controller: model.titleController,
                          hint: "Enter Subject",
                          iconData: FlutterIcons.meetup_faw,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 20),
                              color: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Create & Join Meeting",
                                style: uiHelpers.buttonStyle
                                    .copyWith(color: Colors.white),
                              ),
                              onPressed: () => model.joinMeeting()),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
