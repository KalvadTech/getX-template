import 'package:get/get.dart';
import '../modules/connections/connection_view_model.dart';


class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectionViewModel());
  }
}