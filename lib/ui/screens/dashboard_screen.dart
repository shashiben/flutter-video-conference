import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/colors.dart';
import 'package:video_conference/app/strings.dart';
import 'package:video_conference/ui/screens/contacts_screen.dart';
import 'package:video_conference/ui/screens/home_screen.dart';
import 'package:video_conference/ui/screens/profile_screen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  final tabs = [
    HomeScreen(),
    Center(child: Text("Meetings")),
    ContactScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showWillPop(),
      child: Scaffold(
        body: IndexedStack(
          children: tabs,
          index: currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: IconThemeData(color: primaryColor),
            unselectedIconTheme: IconThemeData(color: backgroundColor),
            selectedLabelStyle: TextStyle(
                fontFamily: "Gilroy", fontSize: 15, color: primaryColor),
            currentIndex: currentIndex,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.home_ant), title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.chat_mco), title: Text("Chats")),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.contacts_ant), title: Text("Contacts")),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.user_ant), title: Text("Profile"))
            ]),
      ),
    );
  }

  showWillPop() async {
    await SnackbarService().showCustomSnackBar(
        title: confirmExitInfo,
        duration: Duration(seconds: 5),
        message: confirmExitMessage,
        backgroundColor: surfaceColor,
        mainButton: FlatButton(onPressed: () => exit(0), child: Text("Yes")));
  }
}
