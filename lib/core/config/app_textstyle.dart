import 'package:estate_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTextStyle {

  static final instance = AppTextStyle._();

  AppTextStyle._();

  /// home title text
  TextStyle displayLarge = TextStyle(
    color: AppColor.textColor,
    fontSize: 40,
    fontWeight: FontWeight.w400,
  );

  // home name
  TextStyle displayMedium = TextStyle(
    color: AppColor.textColorName,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );


  TextStyle displaySmall = TextStyle(
    color: AppColor.primaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );


  // glass container title
  TextStyle headlineLarge = TextStyle(
    color: AppColor.glassText,
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );

  // glass container subtitle
  TextStyle headlineMedium = TextStyle(
    color:  AppColor.glassText,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  /// custom outline button text
  TextStyle headlineSmall = TextStyle(
    color: AppColor.secondaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // see all
  TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColor.secondaryColor,
    fontSize: 14,
  );

  // Search hint
  TextStyle titleMedium = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColor.grey,
    fontSize: 14,
  );

  // hymn name
  TextStyle titleSmall =  TextStyle(
    color: AppColor.textColor1,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // random hymn title
  TextStyle labelLarge = TextStyle(
      color: AppColor.textColor,
      fontSize: 16,
      fontWeight: FontWeight.w400
  );

  // Bottom nav label selected
  TextStyle labelMedium =  TextStyle(
    color: AppColor.secondaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // Bottom nav label unselected
  TextStyle labelSmall = TextStyle(
    color: AppColor.grey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );


  TextStyle bodyLarge = TextStyle(
      color: AppColor.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w400
  );


  TextStyle bodyMedium = TextStyle(
      color: AppColor.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w400
  );

  TextStyle bodySmall = TextStyle(
      color: AppColor.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w400
  );

}

Widget textThemeSample(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "displayLarge",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          "displayMedium",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          "displaySmall",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          "headlineLarge",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "headlineMedium",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          "headlineSmall",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          "titleLarge",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          "titleMedium",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          "titleSmall",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          "labelLarge",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(
          "labelMedium",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          "labelSmall",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          "bodyLarge",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          "bodyMedium",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          "bodySmall",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ),
  );
}