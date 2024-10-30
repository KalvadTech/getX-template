import 'package:get/get.dart';
import '/src/modules/auth/auth.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel(AuthService()));
  }
}