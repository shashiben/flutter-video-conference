import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/viewmodels/chat_viewmodel.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatScreenViewModel>.reactive(
      viewModelBuilder: () => ChatScreenViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
          title: Text(
            "Chats",
            style: TextStyle(
                fontFamily: "Gilroy",
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: Container(),
      ),
    );
  }
}
