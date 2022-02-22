// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_icons/flutter_icons.dart';

// Project imports:
import 'package:video_conference/core/utils/ScreenUiHelper.dart';
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/auth%20page/auth_page_view_model.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
        onModelReady: (dynamic m) => m.init(),
        viewModel: AuthPageViewModel(),
        builder: (BuildContext context, ScreenUiHelper uiHelpers,
                AuthPageViewModel model) =>
            Scaffold(
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
                        onDestinationSelected: model.changeIndex,
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
                            icon: Opacity(
                                opacity: 0, child: Icon(Icons.verified_user)),
                            label: RotatedBox(
                                quarterTurns: 1, child: Text("Login")),
                          ),
                          NavigationRailDestination(
                              icon: Opacity(
                                  opacity: 0,
                                  child: Icon(Icons.signal_cellular_null)),
                              label: RotatedBox(
                                  quarterTurns: 1, child: Text("Signup"))),
                          NavigationRailDestination(
                              icon: Opacity(
                                  opacity: 0, child: Icon(Icons.verified_user)),
                              label: RotatedBox(
                                  quarterTurns: 1,
                                  child: Text("Forgot Password")))
                        ],
                        selectedIndex: model.index),
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.grey[400],
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50)),
                            child: model.views[model.index],
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
                                  FlutterIcons.facebook_fea,
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
                                child: Icon(FlutterIcons.google_faw,
                                    color: Colors.grey, size: 15),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            )));
  }
}
