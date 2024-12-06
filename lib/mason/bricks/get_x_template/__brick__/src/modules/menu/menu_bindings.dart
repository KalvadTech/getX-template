import 'package:get/get.dart';
import 'menu.dart';

/// A class responsible for binding dependencies for the `MenuViewModel`.
///
/// This class ensures that the `MenuViewModel` is lazily initialized and registered
/// only once using the GetX dependency injection system.
/// It implements the [Bindings] interface from GetX.
class MenuBindings implements Bindings {
  /// Registers the [MenuViewModel] if it's not already registered.
  ///
  /// This method is called by GetX to inject the required dependencies when needed.
  @override
  void dependencies() {
    if (!Get.isRegistered<MenuViewModel>()) {
      // Lazily puts the MenuViewModel into the GetX dependency tree.
      Get.lazyPut(() => MenuViewModel());
    }
  }
}
