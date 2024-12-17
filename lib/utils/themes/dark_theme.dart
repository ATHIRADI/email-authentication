import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:version2/utils/utils.dart';

class DarkTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      scaffoldBackgroundColor: AppColors.DarkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.DarkBackground,
        actionsIconTheme: IconThemeData(
          size: AppSizes.iconMd,
          color: AppColors.WhiteColor,
        ),
        elevation: 0, // Flat style
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.DarkPrimary, // FAB background
        foregroundColor: AppColors.DarkOnPrimary, // FAB icon color
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.DarkSurface, // Navbar background
        selectedItemColor: AppColors.DarkPrimary, // Selected icon color
        unselectedItemColor: AppColors.DarkHint, // Unselected icon color
      ),
      cardColor: AppColors.DarkSurface, // Card background
      dividerColor: Colors.grey.shade700, // Divider lines
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.DarkBackground, // Drawer background
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.DarkPrimary, // Button text color
          textStyle: GoogleFonts.poppins(
            fontSize: AppSizes.fontMd,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.DarkPrimary, // Button background
          foregroundColor: AppColors.DarkOnPrimary, // Button text
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColors.DarkHint,
        hintStyle: const TextStyle(
          color: AppColors.DarkHint, // Hint text color
          fontSize: AppSizes.fontSm,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.DarkHint,
            width: AppSizes.borderWidth,
          ),
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.errorColor,
            width: AppSizes.borderWidth,
          ),
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadius,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.DarkPrimary,
            width: AppSizes.borderWidth * 1.5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.DarkError,
            width: AppSizes.borderWidth,
          ),
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
        filled: true,
        fillColor: AppColors.DarkSurface, // Input field background
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.DarkOnBackground, // Icon color
      ),
      textTheme: TextTheme(
        displayMedium: GoogleFonts.poppins(
          color: AppColors.DarkPrimary, // Headline color
        ),
        headlineLarge: GoogleFonts.poppins(
          color: AppColors.DarkOnBackground,
          fontSize: AppSizes.fontLg,
          fontWeight: FontWeight.bold, // Subheadings color
        ),
        labelLarge: GoogleFonts.poppins(
          color: AppColors.DarkOnBackground, // Regular body text
          fontSize: AppSizes.fontMd,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: AppColors.DarkHint, // Muted text for secondary content
          fontSize: AppSizes.fontMd,
        ),
        bodySmall: GoogleFonts.poppins().copyWith(
          color: AppColors.DarkHint, // Muted text for secondary content
          fontSize: AppSizes.fontSm,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.DarkPrimary, // Loader color
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: GoogleFonts.poppins(
          color: AppColors.DarkOnPrimary,
          fontSize: AppSizes.fontSm,
        ),
      ),
    );
  }
}
