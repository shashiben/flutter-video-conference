import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/app/colors.dart';
import 'package:video_conference/viewmodels/profilescreen_viewmodel.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => ProfileScreenViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottomOpacity: 10,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              model.user != null
                  ? Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                model.user.image,
                              )),
                          borderRadius: BorderRadius.circular(80)),
                    )
                  : CircleAvatar(
                      radius: 60,
                      backgroundColor: surfaceColor,
                      child: Icon(
                        FlutterIcons.user_ant,
                        size: 60,
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              Text(
                model.user != null ? model.user.name : "     ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                model.user != null ? model.user.email : "     ",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
      ),
    );
  }
}
