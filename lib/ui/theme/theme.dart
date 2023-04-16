import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/services/ThemePreferences.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:google_fonts/google_fonts.dart';


class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      backgroundColor: Colors.white,
      textTheme: GoogleFonts.beVietnamProTextTheme(),
      primaryColor: primaryColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: contentColorLightTheme),
      // fontFamily: "Poppins",
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: contentColorLightTheme.withOpacity(0.7),
        unselectedItemColor: contentColorLightTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: primaryColor),
        showUnselectedLabels: true,
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      backgroundColor: darkGreyClr,
      primaryColor: primaryColor,
      textTheme: GoogleFonts.beVietnamProTextTheme(),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: contentColorLightTheme,
      iconTheme: const IconThemeData(color: contentColorDarkTheme),
      // fontFamily: "Poppins",
      colorScheme: const ColorScheme.dark().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: contentColorLightTheme,
        selectedItemColor: Colors.white70,
        unselectedItemColor: contentColorDarkTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: primaryColor),
        showUnselectedLabels: true,
      ),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}

TextStyle get textCategoryNameStyle {
  return TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get subHeadingStyle {
  return TextStyle(
      fontSize: 14.sp,
      color: ThemePreferences().isDarkMode ? Colors.white : Colors.grey[500],
      fontWeight: FontWeight.w500);
}

TextStyle get headingStyle {
  return TextStyle(
      fontSize: 16.sp,
      color: ThemePreferences().isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get headerTitleStyle {
  return TextStyle(
      fontSize: 17.sp,
      height: 1.3.h,
      wordSpacing: 0.5.w,
      letterSpacing: 0.5.w,
      color: ThemePreferences().isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get titleStyle {
  return TextStyle(
      fontSize: 14.sp,
      height: 1.3.h,
      wordSpacing: 0.5.w,
      letterSpacing: 0.5.w,
      color: ThemePreferences().isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get subTitleStyle {
  return TextStyle(
      fontSize: 12.sp,
      height: 1.3.h,
      wordSpacing: 0.5.w,
      letterSpacing: 0.5.w,
      color: ThemePreferences().isDarkMode ? Colors.white : Colors.grey[500],
      fontWeight: FontWeight.w400);
}

// final TextStyle subTitleStyle2 = TextStyle(
//     fontSize: 12.sp,
//     color: ThemePreferences().isDarkMode ? Colors.white : Colors.grey[500],
//     fontWeight: FontWeight.w400);

TextStyle get subTitlePrimaryColorStyle {
  return TextStyle(
      fontSize: 13.sp,
      color: ThemePreferences().isDarkMode ? Colors.white : primaryColor,
      fontWeight: FontWeight.w400);
}

TextStyle get categoryTitleStyle {
  return TextStyle(
      fontSize: 16.sp,
      color: ThemePreferences().isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get buttonTitleStyle {
  return TextStyle(
      fontSize: 15.sp,
      color: ThemePreferences().isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get buttonSmallTitleStyle {
  return TextStyle(
      fontSize: 8.sp,
      color: ThemePreferences().isDarkMode ? Colors.white : Colors.white,
      fontWeight: FontWeight.w500);
}

TextStyle get headingSuccessStyle {
  return TextStyle(
      fontSize: 22.sp,
      color: ThemePreferences().isDarkMode ? Colors.white : primaryColor,
      fontWeight: FontWeight.w400);
}
