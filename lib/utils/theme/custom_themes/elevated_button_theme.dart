import 'package:flutter/material.dart';
import 'package:yamaha_auth_module/utils/app_colors.dart';

class JPAppElevatedButtonTheme {
  JPAppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: JPAppColors.color_1,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: BorderSide(color: JPAppColors.color_1),
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        textStyle: const TextStyle(
            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
  );
}
