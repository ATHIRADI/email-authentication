import 'package:flutter/material.dart';
import '../utils/utils.dart'; // Import SharedPreferencesHelper for saving theme mode.

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadThemeMode(); // Load saved theme when the provider is initialized
  }

  // Toggle the theme and save it to shared preferences
  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveThemeMode();
    notifyListeners();
  }

  // Getter for theme data
  ThemeData get themeData {
    return _themeMode == ThemeMode.light ? LightTheme.theme : DarkTheme.theme;
  }

  // Load the theme mode from shared preferences
  Future<void> _loadThemeMode() async {
    ThemeMode savedThemeMode = await SharedPreferencesHelper.getThemeMode();
    _themeMode = savedThemeMode;
    notifyListeners();
  }

  // Save the theme mode to shared preferences
  Future<void> _saveThemeMode() async {
    await SharedPreferencesHelper.saveThemeMode(_themeMode);
  }
}
