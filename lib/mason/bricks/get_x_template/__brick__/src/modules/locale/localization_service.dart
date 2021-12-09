import 'package:get_storage/get_storage.dart';

class LocalizationService {
  late GetStorage _storage;

  LocalizationService() {
    _storage = GetStorage();
  }

  String? get languageCode => _storage.read("languageCode");
  set languageCode (String? languageCode) => _storage.write("languageCode", languageCode);


  saveLocale(String newLanguageCode) {
    languageCode = newLanguageCode;
  }

}
