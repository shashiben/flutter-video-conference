import 'package:flutter/material.dart';
import 'package:video_conference/core/utils/architecture_view.dart';
import './message_page_view_model.dart';

class MessageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: MessagePageViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(),
    );
  }
}
