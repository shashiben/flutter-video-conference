// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:video_conference/app/colors.dart';

final themeData = (BuildContext context) => ThemeData(
    fontFamily: 'Gilroy',
    canvasColor: surfaceColor,
    primaryColor: primaryColor,
    primarySwatch: Colors.teal,
    errorColor: errorColor,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: surfaceColor,
      actionTextColor: textPrimaryColor,
    ),
    iconTheme: IconThemeData(color: primaryColor),
    textTheme: Theme.of(context)
        .textTheme
        .apply(bodyColor: textPrimaryColor, fontFamily: 'Gilroy'),
    scaffoldBackgroundColor: backgroundColor);

final commonThemeData =
    ThemeData(canvasColor: backgroundColor, fontFamily: 'Gilroy');
