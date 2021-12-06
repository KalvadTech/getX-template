import 'package:get/get.dart';
import '../modules/connections/connection_view_model.dart';
import '/data/services/memory_service.dart';


class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MemoryService());
    Get.lazyPut(() => ConnectionViewModel());
  }
}