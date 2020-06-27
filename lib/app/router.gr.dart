// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:video_conference/ui/screens/splashscreen.dart';
import 'package:video_conference/ui/screens/home_screen.dart';
import 'package:video_conference/ui/screens/auth_screen.dart';
import 'package:video_conference/ui/screens/dashboard_screen.dart';
import 'package:video_conference/ui/screens/chat_screen.dart';
import 'package:video_conference/ui/screens/create_profile.dart';
import 'package:video_conference/ui/screens/new_meeting.dart';
import 'package:video_conference/ui/screens/join_meeting.dart';
import 'package:video_conference/ui/screens/schedule_meetings.dart';
import 'package:video_conference/ui/screens/public_meetings.dart';

abstract class Routes {
  static const splashViewRoute = '/';
  static const homeScreenRoute = '/home-screen-route';
  static const authScreenRoute = '/auth-screen-route';
  static const dashboardRoute = '/dashboard-route';
  static const chatScreenRoute = '/chat-screen-route';
  static const createProfileRoute = '/create-profile-route';
  static const newMeetingRoute = '/new-meeting-route';
  static const joinMeetingRoute = '/join-meeting-route';
  static const scheduleRoute = '/schedule-route';
  static const publicMeetingsRoute = '/public-meetings-route';
  static const all = {
    splashViewRoute,
    homeScreenRoute,
    authScreenRoute,
    dashboardRoute,
    chatScreenRoute,
    createProfileRoute,
    newMeetingRoute,
    joinMeetingRoute,
    scheduleRoute,
    publicMeetingsRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashScreen(),
          settings: settings,
        );
      case Routes.homeScreenRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      case Routes.authScreenRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AuthScreen(),
          settings: settings,
        );
      case Routes.dashboardRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Dashboard(),
          settings: settings,
        );
      case Routes.chatScreenRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ChatScreen(),
          settings: settings,
        );
      case Routes.createProfileRoute:
        if (hasInvalidArgs<CreateProfileArguments>(args)) {
          return misTypedArgsRoute<CreateProfileArguments>(args);
        }
        final typedArgs =
            args as CreateProfileArguments ?? CreateProfileArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateProfile(
              key: typedArgs.key,
              email: typedArgs.email,
              password: typedArgs.password),
          settings: settings,
        );
      case Routes.newMeetingRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => NewMeetingView(),
          settings: settings,
        );
      case Routes.joinMeetingRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => JoinMeetingView(),
          settings: settings,
        );
      case Routes.scheduleRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ScheduleView(),
          settings: settings,
        );
      case Routes.publicMeetingsRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => PublicMeetingsView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//CreateProfile arguments holder class
class CreateProfileArguments {
  final Key key;
  final String email;
  final String password;
  CreateProfileArguments({this.key, this.email, this.password});
}
