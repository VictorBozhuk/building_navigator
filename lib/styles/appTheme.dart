import 'package:flutter/material.dart';

import 'helper/custom_material_color.dart';

class AppTheme {
  static const Color iconColorDark = Colors.grey;
  static const Color imageBackground = Colors.white;
  static const Color buttonColor = Color.fromRGBO(60, 60, 60, 1);
  static const Color foreground = Colors.white;

  static const String _fontFamily = 'Poppins';
  static const Color _iconColor = Colors.white;

  static ThemeData get theme {
    return ThemeData(
        fontFamily: _fontFamily,
        textTheme: _textTheme,
        appBarTheme: _appBarTheme,
        iconTheme: _iconTheme,
        colorScheme: _colorScheme);
  }


  static ColorScheme get _colorScheme {
    return ColorScheme.fromSwatch(primarySwatch: CustomMaterialColor(57, 57, 57).color)
      .copyWith(
        background: Colors.black,
        primary: const Color.fromRGBO(25, 25, 25, 1),
        secondary: const Color.fromRGBO(18, 18, 18, 1),
        tertiary: Colors.black,
        error: Colors.red,
    );
  }

  static IconThemeData get _iconTheme {
    return const IconThemeData(
      color: _iconColor,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      backgroundColor: _colorScheme.tertiary,
      toolbarTextStyle: ThemeData.light().textTheme.copyWith(
        titleMedium: const TextStyle(
            fontSize: 20,
            color: foreground)
      ).bodyMedium,
      titleTextStyle: ThemeData.light().textTheme.copyWith(
        titleMedium: const TextStyle(
            fontSize: 20,
            color: foreground)
      ).titleLarge,
    );
  }

  static TextTheme get _textTheme {
    return ThemeData.light().textTheme.copyWith(
      bodySmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: foreground),
      bodyMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: foreground),
      bodyLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: foreground),

      headlineSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.grey.withOpacity(0.5)),
      headlineMedium: const TextStyle(
          fontSize: 20,
          color: foreground),
      headlineLarge: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.normal,
          color: foreground),
    );
  }

  static TextStyle getLevelStyle(Color color){
    return TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: FontWeight.w600);
  }

  static TextStyle getShowIconTextStyle(double size) {
    return TextStyle(
      color: Colors.grey,
      fontFamily: AppTheme._fontFamily,
      fontSize: size,
      fontWeight: FontWeight.w600,
      height: 1.5,
    );
  }

  static TextStyle getAlertTitleTextStyle(double size, {Color color = foreground}) {
    return TextStyle(
      color: color,
      fontFamily: AppTheme._fontFamily,
      fontSize: size,
      fontWeight: FontWeight.w600,
      height: 1.5,
    );
  }
}