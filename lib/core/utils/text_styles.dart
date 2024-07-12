import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_product_screen_task/core/utils/app_colors.dart';

class TextStyles {
  static TextStyle searchHint = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.searchHintColor,
  );
  static TextStyle productNameAndDetails =
      GoogleFonts.roboto(fontSize: 14, color: AppColors.textColor);
  static TextStyle saleTheme = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.saleColor,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.saleColor,
  );
}
