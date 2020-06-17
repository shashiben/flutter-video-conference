import 'package:flutter/material.dart';
import 'package:video_conference/app/colors.dart';
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
    return Scaffold(
      body: IndexedStack(
        children: tabs,
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: primaryColor),
          unselectedIconTheme: IconThemeData(color: surfaceColor),
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
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home"))
          ]),
    );
  }
}
