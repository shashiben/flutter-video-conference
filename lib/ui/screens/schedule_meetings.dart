import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/viewmodels/schedule_viewmodels.dart';

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      viewModelBuilder: () => ScheduleViewModel(),
      builder: (
        BuildContext context,
        ScheduleViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Schedule Meetings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context)),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/illustrations/schedule.png"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'No Scheduled Meetings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
