import 'package:flutter/material.dart';
import 'package:video_conference/app/icons.dart';
import 'package:video_conference/ui/screens/forgot_password.dart';
import 'package:video_conference/ui/screens/login_screen.dart';
import 'package:video_conference/ui/screens/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedIndex = 0;
  final tabs = [LoginScreen(), SignUpScreen(), ForgotPassword()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Row(
        children: [
          Container(
            width: 60,
            child: NavigationRail(
                backgroundColor: Colors.grey[400],
                groupAlignment: 0,
                elevation: 1,
                minWidth: 100,
                onDestinationSelected: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selectedLabelTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w900),
                unselectedLabelTextStyle: TextStyle(
                    fontSize: 10,
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w200),
                labelType: NavigationRailLabelType.all,
                destinations: [
                  NavigationRailDestination(
                    icon: Opacity(opacity: 0, child: Icon(Icons.verified_user)),
                    label: RotatedBox(quarterTurns: 1, child: Text("Login")),
                  ),
                  NavigationRailDestination(
                      icon: Opacity(
                          opacity: 0, child: Icon(Icons.signal_cellular_null)),
                      label:
                          RotatedBox(quarterTurns: 1, child: Text("Signup"))),
                  NavigationRailDestination(
                      icon:
                          Opacity(opacity: 0, child: Icon(Icons.verified_user)),
                      label: RotatedBox(
                          quarterTurns: 1, child: Text("Forgot Password")))
                ],
                selectedIndex: selectedIndex),
          ),
          Expanded(
              child: Container(
            color: Colors.grey[400],
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    child: tabs[selectedIndex],
                  ),
                ),
                Container(
                  color: Colors.grey[400],
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Also Login with",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60)),
                        child: Icon(
                          facebookIcon,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60)),
                        child: Icon(googleIcon, color: Colors.grey, size: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
