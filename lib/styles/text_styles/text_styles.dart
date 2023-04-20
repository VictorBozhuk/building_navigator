import 'package:flutter/material.dart';

import '../../models/room_model.dart';

const TextStyle textStyleOnSplashScreen = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.w800);

const TextStyle textStyleCardTitle = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w600);

const TextStyle textStyleAppBar = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600);

const TextStyle textStyleListOfTitles = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.w600);

const TextStyle textStyleMainNormalText = TextStyle(
    fontSize: 22,
    color: Colors.white);

const TextStyle textStyleMainNormalTextBlack = TextStyle(
    fontSize: 22,
    color: Colors.black);

const TextStyle textStyleMainSmallTextBlack = TextStyle(
    fontSize: 16,
    color: Colors.black);

const TextStyle textStyleMainNormalDrawerText = TextStyle(
    fontSize: 22);

TextStyle textStyleRoomTitleOnPanorama(Room room){
  return TextStyle(
      color: room.color,
      fontSize: room.fontSize,
      fontWeight: FontWeight.w700);
}