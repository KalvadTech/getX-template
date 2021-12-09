import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme_service.dart';


class ThemeViewModel extends GetxController{
  late final ThemeService _themeService;

  final fallbackTheme = ThemeMode.light;

  final RxBool _isDark = false.obs;
  bool get isDark => _isDark.value;


  ThemeMode get theme {
    return _getThemeMode() ?? fallbackTheme;
  }


  ThemeViewModel(this._themeService);

  init() {
    ThemeMode? themeMode = _getThemeMode();
    if (themeMode != null) {
      _updateTheme(themeMode);
    }
  }

  _updateTheme(ThemeMode themeMode) {
    _updateBoolean(themeMode);
    Get.changeThemeMode(themeMode);
  }

  _updateBoolean(ThemeMode themeMode){
    _isDark.value = themeMode == ThemeMode.dark;
  }

  changeTheme(ThemeMode themeMode){
    _updateTheme(themeMode);
    _themeService.saveTheme(themeMode.toString());
  }

  ThemeMode? _getThemeMode(){
    String? preferredTheme = _themeService.themeMode;
    if(preferredTheme != null) {
      return preferredTheme == ThemeMode.light.toString() ? ThemeMode.light : ThemeMode.dark;
    }
    return ThemeMode.system;
  }

}