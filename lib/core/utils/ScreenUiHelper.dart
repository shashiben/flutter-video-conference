// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:video_conference/app/configs.dart';
import 'package:video_conference/core/utils/scaling.dart';
import '../../app/colors.dart' as colors;

class ScreenUiHelper {
  double? width;
  double? height;

  late double blockSizeHorizontal;
  late double blockSizeVertical;

  ScalingHelper? scalingHelper;

  TextStyle? headline;
  TextStyle? title;
  TextStyle? body;
  late TextStyle buttonStyle;

  double? headlineSize;
  double? titleSize;
  double? bodySize;

  Color? surfaceColor;
  Color? backgroundColor;
  Color? primaryColor;
  Color? textPrimaryColor;
  Color? textSecondaryColor;
  Color? dividerColor;

  SizedBox? verticalSpaceLow;
  SizedBox? verticalSpaceMedium;
  SizedBox? verticalSpaceHigh;

  SizedBox? horizontalSpaceLow;
  SizedBox? horizontalSpaceMedium;
  SizedBox? horizontalSpaceHigh;

  ScreenUiHelper.fromContext(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    surfaceColor = colors.surfaceColor;
    backgroundColor = colors.backgroundColor;
    primaryColor = colors.primaryColor;
    textPrimaryColor = colors.textPrimaryColor;
    textSecondaryColor = colors.textSecondaryColor;
    dividerColor = colors.dividerColor;

    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    width = screenWidth;
    height = screenHeight;

    scalingHelper = ScalingHelper(width: screenWidth);

    headlineSize = 26;
    titleSize = 22;
    bodySize = 16;

    headline = TextStyle(
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
        fontSize: headlineSize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.titleFont);

    title = TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: titleSize,
        color: textPrimaryColor,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.titleFont);
    buttonStyle = TextStyle(
        fontFamily: SystemProperties.titleFont,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
        fontSize: bodySize);

    body = TextStyle(
        color: textSecondaryColor,
        fontWeight: FontWeight.w400,
        fontSize: bodySize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.fontName);

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    verticalSpaceLow = SizedBox(
      height: blockSizeVertical * 1.5,
    );
    verticalSpaceMedium = SizedBox(
      height: blockSizeVertical * 4,
    );
    verticalSpaceHigh = SizedBox(
      height: blockSizeVertical * 6,
    );

    horizontalSpaceLow = SizedBox(
      width: blockSizeHorizontal * 1.5,
    );
    horizontalSpaceMedium = SizedBox(
      width: blockSizeHorizontal * 7,
    );
    horizontalSpaceHigh = SizedBox(
      width: blockSizeHorizontal * 11,
    );
  }
}
