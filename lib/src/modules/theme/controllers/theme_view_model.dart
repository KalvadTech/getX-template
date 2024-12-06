import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/theme_service.dart';

/// The `ThemeViewModel` class is responsible for managing the theme mode of the application.
/// It provides methods to initialize, change, and update the theme mode, and interacts with
/// the [ThemeService] to persist the user's theme preference.
class ThemeViewModel extends GetxController {
  /// Service to handle saving and retrieving the theme preference.
  final ThemeService _themeService;

  /// Fallback theme mode in case no preference is found.
  final fallbackTheme = ThemeMode.light;

  /// Reactive boolean to track if the theme is in dark mode.
  final RxBool _isDark = false.obs;

  /// Getter to access the current dark mode status.
  bool get isDark => _isDark.value;

  /// Getter to retrieve the current theme mode.
  ThemeMode get theme {
    return _getThemeMode() ?? fallbackTheme;
  }

  /// Constructor to inject the [ThemeService] dependency.
  ThemeViewModel(this._themeService);

  /// Initializes the theme by applying the saved preference or falling back to the default.
  void init() {
    ThemeMode? themeMode = _getThemeMode();
    if (themeMode != null) {
      _updateTheme(themeMode);
    }
  }

  /// Updates the app's theme to the given [themeMode] and saves the preference.
  void changeTheme(ThemeMode themeMode) {
    _updateTheme(themeMode);
    _themeService.saveTheme(themeMode.toString());
  }

  /// Internal method to update the app's theme mode.
  void _updateTheme(ThemeMode themeMode) {
    _updateBoolean(themeMode);
    Get.changeThemeMode(themeMode);
  }

  /// Updates the `_isDark` boolean based on the given [themeMode].
  void _updateBoolean(ThemeMode themeMode) {
    _isDark.value = themeMode == ThemeMode.dark;
  }

  /// Retrieves the saved theme mode from the [ThemeService].
  ThemeMode? _getThemeMode() {
    String? preferredTheme = _themeService.themeMode;
    if (preferredTheme != null) {
      return preferredTheme == ThemeMode.light.toString()
          ? ThemeMode.light
          : ThemeMode.dark;
    }
    return ThemeMode.system;
  }
}
