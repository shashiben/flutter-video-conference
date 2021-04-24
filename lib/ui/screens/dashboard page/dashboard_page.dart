import 'package:flutter/material.dart';
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/dashboard%20page/dashboard_page_view_model.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: DashboardPageViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(),
    );
  }
}
