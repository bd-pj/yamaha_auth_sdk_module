import 'package:flutter/material.dart';
import 'package:yamaha_auth_module/utils/app_colors.dart';
import 'package:yamaha_auth_module/utils/theme/custom_themes/appbar_theme.dart';
import 'package:yamaha_auth_module/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:yamaha_auth_module/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:yamaha_auth_module/utils/theme/custom_themes/chip_theme.dart';
import 'package:yamaha_auth_module/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:yamaha_auth_module/utils/theme/custom_themes/outline_button_theme.dart';
import 'package:yamaha_auth_module/utils/theme/custom_themes/text_field_theme.dart';
import 'package:yamaha_auth_module/utils/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: JPAppColors.color_1,
    textTheme: JPAppTextTheme.lightTextTheme,
    chipTheme: JPChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: JPAppBarTheme.lightAppBarTheme,
    checkboxTheme: JPCheckboxTheme.lightChexboxTheme,
    bottomSheetTheme: JPBottomSheetTheme.lightBottomSheetThemeData,
    colorScheme: ColorScheme.fromSeed(seedColor: JPAppColors.color_1),
    elevatedButtonTheme: JPAppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: JPOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: JPTextFormFieldTheme.lightInputDecorationTheme,
  );
}
