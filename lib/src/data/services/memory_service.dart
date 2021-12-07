import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MemoryService extends GetConnect {

  late GetStorage _storage;

  MemoryService() {
    _storage = GetStorage();
  }

  String? get languageCode => _storage.read("languageCode");
  set languageCode (String? languageCode) => _storage.write("languageCode", languageCode);


}
