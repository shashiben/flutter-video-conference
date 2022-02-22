// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:video_conference/core/utils/architecture_view.dart';
import '../../widgets/user_circle_header.dart';
import './message_page_view_model.dart';

class MessageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: MessagePageViewModel(),
      builder: (context, uiHelpers, dynamic model) => Scaffold(
        appBar: AppBar(
          title: UserCircleHeader(),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
