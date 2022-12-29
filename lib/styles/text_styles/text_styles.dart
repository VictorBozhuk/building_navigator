import 'package:flutter/material.dart';

import '../../models/room_model.dart';
import '../global/global.dart';

const TextStyle textStyleOnSplashScreen = TextStyle(
    color: Colors.white,
    fontFamily: globalFontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w800);

const TextStyle textStyleCardTitle = TextStyle(
    color: Colors.white,
    fontFamily: globalFontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w600);

const TextStyle textStyleAppBar = TextStyle(
    fontFamily: globalFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600);

const TextStyle textStyleListOfTitles = TextStyle(
    fontFamily: globalFontFamily,
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.w600);

const TextStyle textStyleMainNormalText = TextStyle(
    fontFamily: globalFontFamily,
    fontSize: 22,
    color: Colors.white);

const TextStyle textStyleMainNormalTextBlack = TextStyle(
    fontFamily: globalFontFamily,
    fontSize: 22,
    color: Colors.black);

const TextStyle textStyleMainSmallTextBlack = TextStyle(
    fontFamily: globalFontFamily,
    fontSize: 16,
    color: Colors.black);

const TextStyle textStyleMainNormalDrawerText = TextStyle(
    fontFamily: globalFontFamily,
    fontSize: 22);

TextStyle textStyleRoomTitleOnPanorama(Room room){
  return TextStyle(
      color: room.color,
      fontFamily: globalFontFamily,
      fontSize: room.fontSize,
      fontWeight: FontWeight.w700);
}