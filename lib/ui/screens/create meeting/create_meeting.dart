import 'package:flutter/material.dart';
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/create%20meeting/create_meeting_view_model.dart';

class CreateMeetingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
        viewModel: CreateMeetingViewModel(),
        builder: (context, uiHelpers, CreateMeetingViewModel model) => Scaffold(
              body: Container(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Create Meeting"),
                    centerTitle: true,
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Create a code to create a meeting!",
                          style: uiHelpers.headline,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Code: ",
                            style: uiHelpers.title,
                          ),
                          Text(
                            "code",
                            style: uiHelpers.title,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => model.joinMeeting(),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          decoration: BoxDecoration(
                              // gradient: LinearGradient(
                              //   colors: GradientColors.facebookMessenger,
                              // ),
                              ),
                          child: Center(
                            child: Text(
                              "Create Code",
                              style: uiHelpers.title,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
