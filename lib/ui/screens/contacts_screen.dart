import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/viewmodels/contactscreen_viewmodel.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactScreenViewModel>.reactive(
      viewModelBuilder:()=> ContactScreenViewModel(),
      builder: (context,model,child)=>Scaffold(),
      
    );
  }
}