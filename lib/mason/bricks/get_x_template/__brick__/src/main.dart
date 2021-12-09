import 'package:flutter/material.dart';
import 'package:getx_starter/src/modules/theme/theme.dart';
import 'modules/locale/locale.dart';
import 'package:get/get.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSettings();
  runApp(const App());
}

Future initializeSettings() async {
  LocalizationService localizationService = LocalizationService();
  localizationService.languageCode;
  ThemeService themeService = ThemeService();
  localizationService.languageCode;
  themeService.themeMode;
  await Future.delayed(const Duration(milliseconds: 100));
  Get.put(LocalizationViewModel(localizationService));
  Get.put(ThemeViewModel(themeService));
}
