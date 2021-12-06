import 'package:get/get.dart';
import '/config/app_exception.dart';
import '/config/keys.dart';
import 'connection_view_model.dart';

class ConnectionActions {
  static final ConnectionActions _mInstance = ConnectionActions._();

  static ConnectionActions get instance => _mInstance;

  late ConnectionViewModel _connectionViewModel;

  ConnectionActions._() {
    _connectionViewModel = Get.find();
  }

  Future<void> checkConnectivity() async {
    await _connectionViewModel.getConnectivity();
  }

  Future<void> initSplash(String nextRouteString, int delayInSeconds) async {
    try {
      await Future.delayed(Duration(seconds: delayInSeconds));
      await checkConnectivity();
      Get.offNamed(nextRouteString);
    } on NetworkException catch (e) {
      Get.snackbar(e.prefix.tr, e.message.tr);
    } on Exception {
      Get.snackbar(errorTitle.tr, somethingWentWrongMessage.tr);
    }
  }
}
