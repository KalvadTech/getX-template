import 'dart:ui';
import 'package:get/get.dart';
import 'localization_service.dart';
import 'lang/lang_en.dart';
import 'model/language.dart';

class LocalizationViewModel extends Translations{
  late final LocalizationService _localizationService;

  final fallbackLocale = const Locale('en');

  Locale get locale {
    return _getLocale() ?? fallbackLocale;
  }

  List<Language> languages = [
    Language('English','en'),
    Language('Arabic', 'ar'),
  ];

  LocalizationViewModel(this._localizationService);

  init() {
    String? languageCode = _localizationService.languageCode;
    if (languageCode != null) {
      _updateLocale(languageCode);
    }
  }

  _updateLocale(String languageCode) {
    Get.updateLocale(Locale(languageCode));
  }

  changeLocale(String languageCode){
    _updateLocale(languageCode);
    _localizationService.saveLocale(languageCode);
  }

  Locale? _getLocale(){
    String? preferredLanguage = _localizationService.languageCode;
    print(preferredLanguage);
    if(preferredLanguage != null) {
      return Locale(preferredLanguage);
    }
    return Get.deviceLocale;
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en': englishTranslationsMap,
  };
}