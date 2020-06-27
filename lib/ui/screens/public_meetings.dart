import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/viewmodels/public_meetings_viewmodel.dart';

class PublicMeetingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PublicMeetingsViewModel>.reactive(
      viewModelBuilder: () => PublicMeetingsViewModel(),
      builder: (
        BuildContext context,
        PublicMeetingsViewModel model,
        Widget child,
      ) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                "Public Meetings",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context)),
              centerTitle: true,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/illustrations/nomeetings.png"),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "No meetings for now!!",
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ));
      },
    );
  }
}
