import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/viewmodels/profilescreen_viewmodel.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
      viewModelBuilder:()=> ProfileScreenViewModel(),
      builder: (context,model,child)=>Scaffold(),
      
    );
  }
}