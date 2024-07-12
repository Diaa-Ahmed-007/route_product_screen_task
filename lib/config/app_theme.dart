import 'package:flutter/material.dart';
import 'package:route_product_screen_task/core/utils/app_colors.dart';
import 'package:route_product_screen_task/core/utils/text_styles.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      outline: AppColors.outSideColor,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyles.searchHint,
      titleSmall: TextStyles.productNameAndDetails,
      labelSmall: TextStyles.saleTheme,
    ),
  );
}
