// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:video_conference/core/utils/architecture_view.dart';
import './contacts_view_model.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: ContactPageViewModel(),
      builder: (context, uiHelpers, dynamic model) => Scaffold(),
    );
  }
}
