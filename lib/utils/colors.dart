import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Light Mode Colors
  static const Color Primary = Color(0xFF4A4A4A); // Neutral gray
  static const Color Background = Color(0xFFFAFAFA); // Off-white
  static const Color BlackColor = Color(0xFF333333);
  static const Color WhiteColor = Color(0xFFFFFFFF);

  // General Colors
  static const Color errorColor = Color(0xFFE53935);
  static const Color successColor = Color(0xFF4CAF50);

  // Dark Mode Colors
  static const Color DarkPrimary = Color(0xFF607D8B); // Blue-gray
  static const Color DarkBackground = Color(0xFF1C1C1C); // Main dark background
  static const Color DarkSurface =
      Color(0xFF2B2B2B); // Surface elements like cards
  static const Color DarkOnPrimary = Color(0xFFCFD8DC); // Text on dark primary
  static const Color DarkOnBackground =
      Color(0xFFB0BEC5); // Text on dark background
  static const Color DarkHint = Color(0xFF757575); // Hint text in dark mode
  static const Color DarkError = Color(0xFFB71C1C); // Error color for dark mode
}
