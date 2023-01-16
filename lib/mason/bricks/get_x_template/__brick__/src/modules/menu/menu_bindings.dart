import 'package:get/get.dart';
import 'menu.dart';


class MenuBindings implements Bindings {
  @override
  void dependencies() {
    if(!Get.isRegistered<MenuViewModel>()) {
      Get.lazyPut(() => MenuViewModel());
    }
  }
}