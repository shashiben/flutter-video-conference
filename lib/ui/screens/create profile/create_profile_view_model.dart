// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/snackbar_ui.dart';
import 'package:video_conference/app/strings.dart';
import 'package:video_conference/core/model/user.dart';
import 'package:video_conference/core/services/authentication_service.dart';
import 'package:video_conference/core/services/firestore_service.dart';
import 'package:video_conference/core/services/image_picker_service.dart';
import 'package:video_conference/core/services/snackbar_service.dart';
import 'package:video_conference/core/services/storage_service.dart';
import 'package:video_conference/ui/screens/dashboard%20page/dashboard_page.dart';

class CreateProfileViewModel extends BaseViewModel with SnackbarServiceHelper {
  final ImagePickerService? _imagePickerService = locator<ImagePickerService>();
  final SnackbarService? _snackbarService = locator<SnackbarService>();
  final FirestoreService? _userService = locator<FirestoreService>();
  final AuthenticationService? _authenticationService =
      locator<AuthenticationService>();
  final StorageService? _storageService = locator<StorageService>();
  final NavigationService? _navigationService = locator<NavigationService>();

  String imgUrl = "";
  bool load = false;

  final nameController = TextEditingController();

  File? profileImg;
  String? _email;
  late String _pass;

  pickImageFromCam() async {
    profileImg = await _imagePickerService!.pickImageFromCamera();
    notifyListeners();
  }

  pickImageFromGall() async {
    profileImg = await _imagePickerService!.pickImageFromGallery();
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
        await _authenticationService!.signup(email: _email, password: _pass);
    print("Auth result is:" + res.toString());
    if (res is bool) {
      if (profileImg != null) {
        imgUrl = await (uploadImage(_authenticationService!.getUid()!));
      }
      print("Imgurl is:" + imgUrl.toString());
      User user = User(
          uid: _authenticationService!.getUid(),
          email: _email,
          username: nameController.text,
          name: nameController.text,
          profilePhoto: imgUrl);
      var usrRes = await _userService!.addUserData(user.uid, user);
      print("UserResult is :" + usrRes.toString());
      if (usrRes) {
        navigateToDashboard();
      } else {
        await _snackbarService!.showCustomSnackBar(
            duration: Duration(seconds: 5),
            title: commonErrorTitle,
            message: commonErrorInfo,
            variant: SnackbarType.floating);
      }
    } else {
      await _snackbarService!.showCustomSnackBar(
          duration: Duration(seconds: 5),
          title: commonErrorTitle,
          message: commonErrorInfo,
          variant: SnackbarType.floating);
    }

    setBusy(false);
  }

  navigateToDashboard() {
    _navigationService!
        .navigateWithTransition(DashboardPage(), transition: "fade");
  }

  Future uploadImage(String uid) async {
    var result = await _storageService!
        .uploadImage(file: profileImg!, fileName: uid, collectionName: "users");
    return result;
  }

  init(String email, String password) {
    _email = email;
    _pass = password;
  }
}
