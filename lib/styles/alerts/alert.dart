import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AlertStyle getAlertStyle() => AlertStyle(
  backgroundColor: Colors.transparent,
  animationType: AnimationType.fromTop,
  isCloseButton: true,
  isOverlayTapDismiss: false,
  animationDuration: const Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
);
