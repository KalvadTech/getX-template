import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import '/config/app_exception.dart';
import '/config/keys.dart';

enum ConnectivityType { mobileData, wifi, disconnected, noInternet, connecting }

class ConnectionViewModel extends GetxController {
  Rx<ConnectivityType> connectionType = ConnectivityType.connecting.obs;

  late final Connectivity _connectivity;
  late StreamSubscription _streamSubscription;

  ConnectionViewModel() {
    _connectivity = Connectivity();
    _listenToConnectivity();
  }

  _listenToConnectivity() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future getConnectivity() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    await _updateState(connectivityResult);
  }

  isConnected() {
    return connectionType.value == ConnectivityType.wifi ||
        connectionType.value == ConnectivityType.mobileData ||
        connectionType.value == ConnectivityType.connecting;
  }

  _updateState(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = ConnectivityType.wifi;
        await _checkInternetConnection();
        break;
      case ConnectivityResult.mobile:
        connectionType.value = ConnectivityType.mobileData;
        await _checkInternetConnection();
        break;
      case ConnectivityResult.none:
        connectionType.value = ConnectivityType.disconnected;
        throw NetworkException(noInternetMessage);
      default:
        connectionType.value = ConnectivityType.disconnected;
        throw NetworkException(checkNetworkFailedMessage);
    }
  }

  _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isEmpty) {
        throw Exception(checkNetworkFailedMessage);
      }
    }
    catch(e){
      connectionType.value = ConnectivityType.noInternet;
      throw NetworkException(noInternetMessage);
    }

  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
