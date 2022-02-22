// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:video_conference/core/utils/architecture_view.dart';
import 'history_page_view_model.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: HistoryPageViewModel(),
      builder: (context, uiHelpers, dynamic model) => Scaffold(),
    );
  }
}
