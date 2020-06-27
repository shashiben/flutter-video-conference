import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/app/colors.dart';
import 'package:video_conference/ui/widgets/icon_button.dart';
import 'package:video_conference/ui/widgets/inputField.dart';
import 'package:video_conference/viewmodels/homescreen_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Meet & Chat"),
          actions: [
            InkWell(
              onTap: () => model.navigateToChat(),
              child: Container(
                padding: const EdgeInsets.only(right: 12.0),
                child: Icon(FlutterIcons.send_o_faw),
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(
                hint: "Search",
                iconData: Icons.search,
              ),
              Divider(
                height: 15,
                color: surfaceColor,
                thickness: 0.2,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => model.navigateToNewMeeting(),
                    child: IconScreen(
                      iconData: Icons.videocam,
                      text: "New Meeting",
                      color: Colors.orange,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => model.navigateToJoinMeeting(),
                    child: IconScreen(
                      iconData: Icons.add,
                      text: "Join",
                      color: Colors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => model.navigateToSchedule(),
                    child: IconScreen(
                      iconData: Icons.schedule,
                      text: "Schedule",
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => model.navigateToPublic(),
                    child: IconScreen(
                      iconData: FlutterIcons.public_mdi,
                      text: "Public Meetings",
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 3,
                color: surfaceColor,
                height: 30,
              ),
              Text("Popular Live Meetings",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
