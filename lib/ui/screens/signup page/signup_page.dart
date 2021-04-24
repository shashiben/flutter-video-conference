import 'package:flutter/material.dart';
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/signup%20page/signup_page_view_model.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: SignupViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(),
    );
  }
}
