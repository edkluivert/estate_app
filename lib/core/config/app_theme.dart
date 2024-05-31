import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_textstyle.dart';


class AppTheme {

  static final _textStyle = AppTextStyle.instance;

  static ThemeData light = ThemeData(
    fontFamily: 'EuclidA',
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.homeBg,
    cardColor: AppColor.primaryColor,
    hintColor: AppColor.grey,
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColor.secondaryColor
    ),
    // buttonTheme: ButtonThemeData(
    //   buttonColor: AppColor.secondaryColor,
    //     textTheme: ButtonTextTheme.primary,
    //   colorScheme:  Get.theme.colorScheme.copyWith(secondary: AppColor.secondaryColor ,background: AppColor.secondaryColor),
    // ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primaryColor,
    ),
    iconTheme: IconThemeData(
      color: AppColor.primaryColor,
    ),
    // primarySwatch: AppColor.primarySwatch,
    textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: AppColor.secondaryColor,
        selectionColor: AppColor.grey.withOpacity(0.5)
    ),
    textTheme: TextTheme(
      displayLarge: _textStyle.displayLarge,
      displayMedium: _textStyle.displayMedium,
      displaySmall: _textStyle.displaySmall,
      headlineLarge: _textStyle.headlineLarge,
      headlineMedium: _textStyle.headlineMedium,
      headlineSmall: _textStyle.headlineSmall,
      titleLarge: _textStyle.titleLarge,
      titleSmall: _textStyle.titleSmall,
      titleMedium: _textStyle.titleMedium,
      labelLarge: _textStyle.labelLarge,
      labelMedium: _textStyle.labelMedium,
      labelSmall: _textStyle.labelSmall,
      bodyLarge: _textStyle.bodyLarge,
      bodyMedium: _textStyle.bodyMedium,
      bodySmall: _textStyle.bodySmall,
    ), colorScheme: ColorScheme(background: AppColor.primaryColor, primary:AppColor.primaryColor,
      brightness: Brightness.light, onPrimary: AppColor.primaryColor,
      secondary: AppColor.primaryColor, onSecondary: AppColor.primaryColor,
      error: AppColor.secondaryColor, onError: AppColor.secondaryColor,
      onBackground: AppColor.primaryColor, surface: AppColor.primaryColor, onSurface: AppColor.textColor),
  );


}