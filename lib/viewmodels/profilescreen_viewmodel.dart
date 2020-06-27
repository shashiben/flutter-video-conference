import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/model/user/user.dart';
import 'package:video_conference/services/authentication_service.dart';
import 'package:video_conference/services/user_service.dart';

class ProfileScreenViewModel extends BaseViewModel {
  final UserService _userService = locator<UserService>();
  final AuthenticationService _authService = locator<AuthenticationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  bool shimmer = true;

  User _user;
  User get user => _user;

  init() async {
    shimmer = true;
    var data = await _userService.getUserdata(await _authService.getUid());
    if (!(data is String)) {
      _user = data;
      shimmer = false;
    } else {
      _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          title: "Error occured",
          icon: Icon(FlutterIcons.error_mdi),
          message: data.toString());
    }
    notifyListeners();
  }
}
