import 'package:flutter/material.dart';
import 'package:route_product_screen_task/core/utils/app_colors.dart';
import 'package:route_product_screen_task/core/utils/text_styles.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor, primary: AppColors.primaryColor),
  textTheme: TextTheme(
    titleMedium: TextStyles.searchHint,
  ),
  );
}
