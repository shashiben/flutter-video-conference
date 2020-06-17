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

abstract class Routes {
  static const splashViewRoute = '/';
  static const homeScreenRoute = '/home-screen-route';
  static const authScreenRoute = '/auth-screen-route';
  static const dashboardRoute = '/dashboard-route';
  static const all = {
    splashViewRoute,
    homeScreenRoute,
    authScreenRoute,
    dashboardRoute,
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
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
