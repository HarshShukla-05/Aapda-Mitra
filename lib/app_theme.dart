import 'package:flutter/material.dart';

class AppTheme {
  // Define custom colors as per your requirements
  static const Color primaryColor = Color(0xFF4C9EEB); // Light blue
  static const Color secondaryColor = Color(0xFFBDC5CD); // Divider color
  static const Color backgroundColor =
      Colors.white; // Scaffold background color
  static const Color errorColor = Color(0xFFCE395F); // Red for errors
  static const Color onPrimaryColor =
      Colors.white; // Text color for buttons with primary background
  static const Color onSecondaryColor =
      Color(0xFF4C9EEB); // Blue text on secondary background

  static const Color boldTextColor = Color(0xFF141619); // Dark text color
  static const Color mediumTextColor = Color(0xFF455154); // Medium text
  static const Color lightTextColor = Color(0xFF687684); // Light text color

  // Text styles with specific font weights
  static const String defaultFont = 'SF Pro Display';
  static const String secondaryFont = 'Inter';
  static const String tertiaryFont = 'Poppins';

  // Divider Color
  static const Color primaryDividerColor = Color(0xFFBDC5CD);
  static const Color secondaryDividerColor = Color(0xFF4C9EEB);

  //LightTheme
  static ThemeData lightTheme(BuildContext context) {
    //
    return ThemeData(
      useMaterial3: true, // Latest material design
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      //ColorScheme
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor, // Used for most prominent elements
        onPrimary: onPrimaryColor, // Text on primary-colored widgets
        secondary:
            secondaryColor, // Used for less prominent elements, like dividers
        onSecondary: onSecondaryColor, // Text on secondary-colored widgets
        error: errorColor, // Red for errors
        onError: Colors.white,

        surface: Colors.white, // Color for surfaces like cards
        onSurface: boldTextColor, // Text color on surfaces
      ),

      //TextTheme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: defaultFont,
          fontWeight: FontWeight.w700,
          color: boldTextColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: defaultFont,
          fontWeight: FontWeight.w500,
          color: mediumTextColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: defaultFont,
          fontWeight: FontWeight.w400,
          color: lightTextColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: secondaryFont,
          fontWeight: FontWeight.w400,
          color: mediumTextColor,
        ),
        titleMedium: TextStyle(
          fontFamily: tertiaryFont,
          fontWeight: FontWeight.w500,
          color: lightTextColor,
        ),
        labelLarge: TextStyle(
          fontFamily: defaultFont,
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
      ),

      //ElevatedButtonTheme

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(), // No rounded border
        ),
      ),
      // Set divider color
    );
  }
}
