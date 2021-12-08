import 'package:flutter/material.dart';
import 'modules/locale/locale.dart';
import 'package:get/get.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalizationService localizationService = LocalizationService();
  localizationService.languageCode;
  await Future.delayed(const Duration(milliseconds: 100));
  Get.put(LocalizationViewModel(localizationService));
  runApp(const App());
}
