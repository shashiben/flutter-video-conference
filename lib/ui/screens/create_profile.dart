import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/app/colors.dart';
import 'package:video_conference/ui/widgets/inputField.dart';
import 'package:video_conference/viewmodels/createprofile_viewmodel.dart';

class CreateProfile extends StatelessWidget {
  final String email;
  final String password;

  const CreateProfile({Key key, this.email, this.password}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateProfileViewModel>.reactive(
      viewModelBuilder: () => CreateProfileViewModel(),
      onModelReady: (model) => model.init(email, password),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "Gilroy"),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (_) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: ListTile(
                                    dense: true,
                                    trailing: IconButton(
                                        onPressed: () {
                                          model.deletePic();
                                          Navigator.of(context).pop();
                                        },
                                        icon: Icon(
                                          FlutterIcons.delete_ant,
                                          size: 30,
                                        )),
                                    title: Text(
                                      'Choose An Option',
                                      style: TextStyle(
                                          fontFamily: "Gilroy",
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              //SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          FlutterIcons.camera_ant,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          model.pickImageFromCam();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      Text(
                                        'Camera',
                                        style: TextStyle(
                                            fontFamily: "Gilroy",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          FlutterIcons.ios_image_ion,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          model.pickImageFromGall();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      Text(
                                        'Gallery',
                                        style: TextStyle(
                                            fontFamily: "Gilroy",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          )),
                  child: CircleAvatar(
                    radius: 80,
                    child: model.profileImg == null
                        ? Icon(
                            FlutterIcons.add_a_photo_mdi,
                            size: 40,
                          )
                        : CircleAvatar(
                            radius: 80,
                            backgroundImage: FileImage(model.profileImg),
                          ),
                  ),
                ),
                SizedBox(height: 20),
                InputField(
                  hint: "Enter username",
                  iconData: FlutterIcons.user_ant,
                  controller: model.nameController,
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                      onPressed: () => model.signup(),
                      child: model.load
                          ? CircularProgressIndicator(
                              backgroundColor: Colors.white)
                          : Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Gilroy",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
