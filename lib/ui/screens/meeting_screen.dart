import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/viewmodels/meetingscreen_viewmodel.dart';

class MeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingScreenViewModel>.reactive(
      viewModelBuilder:()=> MeetingScreenViewModel(),
      builder: (context,model,child)=>Scaffold(),
      
    );
  }
}