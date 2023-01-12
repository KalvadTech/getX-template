import 'package:get/get.dart';
import '../../utils/utils.dart';
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
    Utils.exceptionHandler(() async{
      await Future.delayed(Duration(seconds: delayInSeconds));
      await checkConnectivity();
      Get.offNamed(nextRouteString);
    });
  }
}
