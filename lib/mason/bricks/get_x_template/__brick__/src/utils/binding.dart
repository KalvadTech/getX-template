import 'package:get/get.dart';
import '/src/modules/auth/auth.dart';
import '/src/modules/connections/connection_view_model.dart';


class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectionViewModel());
    AuthBindings().dependencies();
  }
}