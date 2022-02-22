// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'colors.dart';
import 'locator.dart';

enum SnackbarType { floating }
void setupSnackbarUi() {
  final service = locator<SnackbarService>();
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.floating,
    config: SnackbarConfig(
        margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
        messageColor: Colors.white70,
        backgroundColor: surfaceColor,
        mainButtonTextColor: primaryColor,
        padding: const EdgeInsets.all(12).copyWith(top: 15),
        textColor: Colors.white,
        overlayBlur: 2,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        barBlur: 2,
        boxShadows: [BoxShadow(color: primaryColor)],
        animationDuration: Duration(seconds: 2),
        borderRadius: 10,
        dismissDirection: DismissDirection.vertical),
  );
}
