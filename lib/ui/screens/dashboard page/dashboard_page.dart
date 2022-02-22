// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/dashboard%20page/dashboard_page_view_model.dart';
import '../contact page/contacts_view.dart';
import '../history page/history_page_view.dart';
import '../message page/message_page_view.dart';

class DashboardPage extends StatelessWidget {
  final views = [MessageView(), HistoryView(), ContactPage()];
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: DashboardPageViewModel(),
      builder: (context, uiHelpers, DashboardPageViewModel model) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60, left: 30),
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NSD Solutions",
                    style: uiHelpers.headline,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Now you can connect everyone at a single tap.",
                    style: uiHelpers.body,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                decoration: BoxDecoration(
                    color: uiHelpers.surfaceColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Center(
                    child: Column(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                          onPressed: () => model.navigateToCreateMeeting(),
                          child: Row(
                            children: [
                              Flexible(
                                  flex: 7,
                                  child: Image.asset(
                                    "assets/illustrations/create_meeting.png",
                                    fit: BoxFit.fill,
                                  )),
                              Flexible(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Create Room",
                                      style: uiHelpers.title,
                                    ),
                                    Text(
                                      "Now create your own room just by single click and can share across your friends and family.",
                                      style: uiHelpers.body,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 2,
                          margin: const EdgeInsets.all(20),
                          color: const Color(0xFF1A1E78)),
                    ),
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                          onPressed: () => model.navigateToJoinMeeting(),
                          child: Row(
                            children: [
                              Flexible(
                                  flex: 6,
                                  child: Image.asset(
                                    "assets/illustrations/join_meeting.png",
                                    fit: BoxFit.fill,
                                  )),
                              Flexible(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Join Room",
                                      style: uiHelpers.title,
                                    ),
                                    Text(
                                      "Got an invited link just tap here and enter Id.Everything happens by a single click",
                                      style: uiHelpers.body,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
