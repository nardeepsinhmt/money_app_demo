import 'package:flutter/material.dart';

class AppTheme{
  static const String fontName = 'Montserrat';

  static const Color primaryColor = Color(0xFFC0028B);
  static const Color darkPrimaryColor = Color(0xFFE4E6EB);
  static const Color primaryLightColor = Color(0xFFF9E6F3);

  static const Color accentColor = Color(0xFFB0B3B8);
  static const Color secondaryColor = Color(0xFFB0B3B8);

  static const Color lightWhiteColor = Color(0xFFF7F7F7);
  static const Color backgroundColor = Color(0xFF18191A);
  static const Color scaffoldBackgroundColor = Color(0xFFE5E5E5);
  static const Color cardColor = Color(0xFF242526);
  static const Color hoverColor = Color(0xFF3A3B3C);
  static const Color errorColor = Color(0xFFFF0000);

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);

  static const Color textWhiteColor = Color(0xFFFFFFFF);
  static const Color textBlackColor = Color(0xFF000000);
  static const Color buttonColor = Color(0XFFF7F7F7);

  static const Color primarySwatchColor = Color(0xFF18191A);
  static MaterialColor primarySwatch = MaterialColor(primarySwatchColor.value, {
    50: primarySwatchColor.withOpacity(0.05),
    100: primarySwatchColor.withOpacity(0.1),
    200: primarySwatchColor.withOpacity(0.2),
    300: primarySwatchColor.withOpacity(0.3),
    400: primarySwatchColor.withOpacity(0.4),
    500: primarySwatchColor.withOpacity(0.5),
    600: primarySwatchColor.withOpacity(0.6),
    700: primarySwatchColor.withOpacity(0.7),
    800: primarySwatchColor.withOpacity(0.8),
    900: primarySwatchColor.withOpacity(0.9)
  });

  static ThemeData moneyAppThemeData = ThemeData(
    fontFamily: fontName,
    primaryColor: primaryColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: accentColor,
    ),
    primarySwatch: primarySwatch,
    accentColor: accentColor,
    buttonColor: secondaryColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: secondaryColor,
    ),
    cardColor: accentColor,
    backgroundColor: backgroundColor,
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    canvasColor: primaryColor,
    indicatorColor: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
  );
}

class MoneyAppTextStyle{

  static const TextStyle appBarTitle = TextStyle(
    fontFamily: AppTheme.fontName,
    fontSize: 16.0,
    color: AppTheme.lightWhiteColor,
    height: 0.22,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle title = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.w600,
    fontSize: 25,
    height: 0.22,
    color: AppTheme.textWhiteColor,
  );

  static const TextStyle mediumText = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppTheme.textBlackColor,
  );

  static const TextStyle smallText = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppTheme.textBlackColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
      fontFamily: AppTheme.fontName,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppTheme.whiteColor);

}