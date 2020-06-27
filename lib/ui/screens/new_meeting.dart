import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/app/colors.dart';
import 'package:video_conference/ui/widgets/inputField.dart';
import 'package:video_conference/viewmodels/new_meeting_viewmodel.dart';

class NewMeetingView extends StatefulWidget {
  @override
  _NewMeetingViewState createState() => _NewMeetingViewState();
}

class _NewMeetingViewState extends State<NewMeetingView> {
  TextEditingController titleController, passwordController;
  @override
  void initState() {
    titleController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewMeetingViewModel>.reactive(
      viewModelBuilder: () => NewMeetingViewModel(),
      builder: (
        context,
        model,
        child,
      ) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context)),
              title: Text("Start a Meeting",
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              centerTitle: true,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ListTile(
                      leading: Icon(
                          !model.muteVideo
                              ? FlutterIcons.video_off_mco
                              : FlutterIcons.video_fou,
                          color: Colors.white),
                      title: Text(
                        "Mute Other Videos",
                        style: TextStyle(
                            fontFamily: "Gilroy", fontWeight: FontWeight.bold),
                      ),
                      trailing: CupertinoSwitch(
                          trackColor: surfaceColor,
                          activeColor: primaryColor,
                          value: model.muteVideo,
                          onChanged: (c) => model.changeVideo())),
                  ListTile(
                      leading: Icon(
                          model.muteAudio
                              ? FlutterIcons.volume_high_mco
                              : FlutterIcons.mute_oct,
                          color: Colors.white),
                      title: Text(
                        "Mute Other Voices",
                        style: TextStyle(
                            fontFamily: "Gilroy", fontWeight: FontWeight.bold),
                      ),
                      trailing: CupertinoSwitch(
                          trackColor: surfaceColor,
                          activeColor: primaryColor,
                          value: model.muteAudio,
                          onChanged: (c) => model.changeAudio())),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: InputField(
                      controller: titleController,
                      hint: "Enter title",
                      iconData: FlutterIcons.title_mdi,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: InputField(
                        controller: passwordController,
                        hint: "Enter password",
                        iconData: FlutterIcons.textbox_password_mco),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () => model.validate(
                        title: titleController.text,
                        password: passwordController.text),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      alignment: Alignment.bottomRight,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Create Meeting",
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
