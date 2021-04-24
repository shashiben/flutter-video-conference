import 'package:flutter/material.dart';
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/create%20profile/create_profile_view_model.dart';

class CreateProfile extends StatelessWidget {
  final String email;
  final String password;

  const CreateProfile({Key key, this.email, this.password}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      onModelReady: (m) => m.init(email, password),
      viewModel: CreateProfileViewModel(),
      builder: (context, uihelpers, model) => Scaffold(),
    );
  }
}
