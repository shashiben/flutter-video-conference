import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/app/colors.dart';
import 'package:video_conference/app/icons.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/router.gr.dart';
import 'package:video_conference/app/strings.dart';
import 'package:video_conference/model/user.dart';
import 'package:video_conference/services/authentication_service.dart';
import 'package:video_conference/services/imagepicker_service.dart';
import 'package:video_conference/services/snackbarservices.dart';
import 'package:video_conference/services/storage_service.dart';
import 'package:video_conference/services/user_service.dart';

class CreateProfileViewModel extends BaseViewModel with SnackbarServiceHelper {
  final ImagePickerService _imagePickerService = locator<ImagePickerService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final UserService _userService = locator<UserService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final StorageService _storageService = locator<StorageService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String imgUrl = "";
  bool load = false;

  final nameController = TextEditingController();

  File profileImg;
  String _email;
  String _pass;

  pickImageFromCam() async {
    profileImg = await _imagePickerService.pickImageFromCamera();
    notifyListeners();
  }

  pickImageFromGall() async {
    profileImg = await _imagePickerService.pickImageFromGallery();
    notifyListeners();
  }

  deletePic() {
    profileImg?.delete();
    profileImg = null;
    notifyListeners();
  }

  signup() async {
    setBusy(true);
    load = true;
    createUser();
    setBusy(false);
  }

  createUser() async {
    setBusy(true);
    var res =
        await _authenticationService.signup(email: _email, password: _pass);
    print("Auth result is:" + res.toString());
    if (res is bool) {
      if (profileImg != null) {
        imgUrl = await uploadImage(await _authenticationService.getUid());
      }
      print("Imgurl is:" + imgUrl.toString());
      User user = User(
          uid: await _authenticationService.getUid(),
          email: _email,
          name: nameController.text,
          image: imgUrl);
      var usrRes = await _userService.saveUser(user);
      print("UserResult is :" + usrRes.toString());
      if (usrRes == "success") {
        navigateToDashboard();
      } else {
        await _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          title: commonErrorTitle,
          message: commonErrorInfo,
          icon: Icon(
            infoIcon,
            color: errorColor,
          ),
        );
      }
    } else {
      await _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 5),
        title: commonErrorTitle,
        message: commonErrorInfo,
        icon: Icon(
          infoIcon,
          color: errorColor,
        ),
      );
    }

    setBusy(false);
  }

  navigateToDashboard() {
    _navigationService.navigateTo(Routes.dashboardRoute);
  }

  Future uploadImage(String uid) async {
    var result = await _storageService.uploadImage(image: profileImg, uid: uid);
    return result;
  }

  init(String email, String password) {
    _email = email;
    _pass = password;
  }
}
