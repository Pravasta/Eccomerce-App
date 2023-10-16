import 'package:flutter/material.dart';

import 'colors.dart';

/// App Text Config. This is the default configuration for the text in the app.
class _AppTextConfig {
  static const String fontFamily = "Urbanist";
  static const double height = 1.3;
  static const Color primaryColor = AppColors.blackColor;
}

/// App Text Weight. This is used to set the font weight of the text.
class AppTextWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

/// App Text Style. Use this class to create TextStyle.
class AppTextStyle {
  static const TextStyle textExtraSmall = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 10,
    overflow: TextOverflow.ellipsis,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textSmall = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 14,
    overflow: TextOverflow.ellipsis,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textMedium = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 16,
    overflow: TextOverflow.ellipsis,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textLarge = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 17,
    overflow: TextOverflow.ellipsis,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textExtraLarge = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 18,
    overflow: TextOverflow.ellipsis,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textDoubleExtraLarge = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 20,
    overflow: TextOverflow.ellipsis,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textTripleExtraLarge = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 32,
    overflow: TextOverflow.ellipsis,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
}
