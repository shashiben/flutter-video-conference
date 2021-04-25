import 'package:flutter/material.dart';
import 'package:video_conference/core/utils/architecture_view.dart';
import './message_page_view_model.dart';
import '../../widgets/user_circle_header.dart';

class MessageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: MessagePageViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
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
