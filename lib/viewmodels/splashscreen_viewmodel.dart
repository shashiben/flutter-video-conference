import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/router.gr.dart';
import 'package:video_conference/services/authentication_service.dart';

class SplashScreenViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  init(BuildContext context) async {
    await precacheImage(AssetImage("assets/illustrations/splash.png"), context);
    var isUserLogged = await _authenticationService.isUserLoggedIn();

    if (isUserLogged) {
      _navigationService.navigateTo(Routes.dashboardRoute);
    } else {
      _navigationService.navigateTo(Routes.authScreenRoute);
    }
  }
}
