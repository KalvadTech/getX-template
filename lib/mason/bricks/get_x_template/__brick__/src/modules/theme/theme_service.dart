import 'package:get_storage/get_storage.dart';

class ThemeService {
  late GetStorage _storage;

  ThemeService() {
    _storage = GetStorage();
  }

  String? get themeMode => _storage.read("themeMode");
  set themeMode (String? themeMode) => _storage.write("themeMode", themeMode);


  saveTheme(String newThemeMode) {
    themeMode = newThemeMode;
  }

}
