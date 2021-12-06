import 'package:get/get.dart';
import 'lang/lang_en.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': englishTranslationsMap,
      };
}
