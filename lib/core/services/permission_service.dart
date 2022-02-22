// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:permission_handler/permission_handler.dart';

class Permissions {
  static Future<bool> cameraAndMicrophonePermissionsGranted() async {
    PermissionStatus cameraPermissionStatus = await _getCameraPermission();
    PermissionStatus microphonePermissionStatus =
        await _getMicrophonePermission();

    if (cameraPermissionStatus == PermissionStatus.granted &&
        microphonePermissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      _handleInvalidPermissions(
          cameraPermissionStatus, microphonePermissionStatus);
      return false;
    }
  }

  static Future<PermissionStatus> _getCameraPermission() async {
    bool permission = await Permission.camera.isGranted;
    if (!permission) {
      while (!(await Permission.camera.isGranted)) {
        await Permission.camera.request();
      }
    }
    return PermissionStatus.granted;
  }

  static Future<PermissionStatus> _getMicrophonePermission() async {
    bool permission = await Permission.microphone.isGranted;
    if (!permission) {
      while (!(await Permission.microphone.isGranted)) {
        await Permission.microphone.request();
      }
    }
    return PermissionStatus.granted;
  }

  static void _handleInvalidPermissions(
    PermissionStatus cameraPermissionStatus,
    PermissionStatus microphonePermissionStatus,
  ) {
    if (cameraPermissionStatus == PermissionStatus.denied &&
        microphonePermissionStatus == PermissionStatus.denied) {
      throw new PlatformException(
          code: "PERMISSION_DENIED",
          message: "Access to camera and microphone denied",
          details: null);
    } else if (cameraPermissionStatus == PermissionStatus.permanentlyDenied &&
        microphonePermissionStatus == PermissionStatus.permanentlyDenied) {
      throw new PlatformException(
          code: "PERMISSION_DISABLED",
          message: "Location data is not available on device",
          details: null);
    }
  }
}
