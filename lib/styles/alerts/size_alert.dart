import 'package:flutter/material.dart';

class AlertSmallButtonSize {
  late final double width;
  late final double height;
  late final double textSize;
  AlertSmallButtonSize(this.width, this.height, this.textSize);
}

class AlertSize {
  late final double width;
  late final double textSizeSmall;
  late final double textSizeMedium;
  late final double textSizeLarge;
  late final double textSizeTitle;
  late final double mainIconSize;
  late final double closeIconSize;
  late final double paddingTop;
  late final double paddingTitle;
  late final AlertSmallButtonSize smallButtonSize;
  AlertSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    width = screenWidth * 0.6377;
    textSizeSmall = screenWidth * 0.0255;
    textSizeMedium = screenWidth * 0.0306;
    textSizeLarge = screenWidth * 0.0357;
    textSizeTitle = screenWidth * 0.0459;
    mainIconSize = screenWidth * 0.0765;
    closeIconSize = screenWidth * 0.07;
    paddingTop = screenWidth * 0.0255;
    paddingTitle = screenWidth * 0.102;
    smallButtonSize = AlertSmallButtonSize(screenWidth * 0.2551, screenWidth * 0.0765, screenWidth * 0.0357);
  }
}
