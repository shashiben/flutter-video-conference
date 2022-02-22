// Dart imports:
import 'dart:io';

// Flutter imports:

// Package imports:
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/core/services/image_picker_service.dart';
import 'package:video_conference/core/utils/user_state_enum.dart';

class UserUtils {
  static final ImagePickerService? _imagePickerService =
      locator<ImagePickerService>();
  static String getUsername(String email) {
    return "live:${email.split('@')[0]}";
  }

  static String getInitials(String name) {
    List<String> nameSplit = name.split(" ");
    String firstNameInitial = nameSplit[0][0];
    String lastNameInitial = nameSplit[1][0];
    return firstNameInitial + lastNameInitial;
  }

  static Future<File> pickImage({required ImageSource source}) async {
    File selectedImage = source == ImageSource.camera
        ? await _imagePickerService!.pickImageFromCamera()
        : await _imagePickerService!.pickImageFromGallery();
    return selectedImage;
  }

  static int stateToNum(UserState userState) {
    switch (userState) {
      case UserState.Offline:
        return 0;

      case UserState.Online:
        return 1;

      default:
        return 2;
    }
  }

  static UserState numToState(int number) {
    switch (number) {
      case 0:
        return UserState.Offline;

      case 1:
        return UserState.Online;

      default:
        return UserState.Waiting;
    }
  }

  static String formatDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    var formatter = DateFormat('dd/MM/yy');
    return formatter.format(dateTime);
  }
}
