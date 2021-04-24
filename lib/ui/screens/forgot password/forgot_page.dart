import 'package:flutter/material.dart';
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/forgot%20password/forgot_page_view_model.dart';

class ForgotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: ForgotPageViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(),
    );
  }
}
