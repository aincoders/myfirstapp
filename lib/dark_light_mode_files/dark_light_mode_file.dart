import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadThemeFromPreferences();
  }

  // Toggles between dark and light theme
  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    _saveThemeToPreferences();
  }

  // Loads theme preference from SharedPreferences
  Future<void> _loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  // Saves theme preference to SharedPreferences
  Future<void> _saveThemeToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  // Manually set theme to dark mode, persists change
  Future<void> setDarkMode() async {
    _isDarkMode = true;
    notifyListeners();
    await _saveThemeToPreferences();
  }
}
