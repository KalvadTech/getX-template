import 'dart:developer';
import 'dart:isolate';
import 'package:get/get.dart';

class Utils {

  Future<T> isolator<T>(T Function() function) async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn((message) {
      T result = function();
      Isolate.exit(message as SendPort?, result);
    }, receivePort.sendPort);
    return await receivePort.first as T;
  }

}



void handleError(Response response) {
  if (response.hasError) {
    if (response.status.isNotFound) {
      throw Exception(response.statusText);
    } else {
      throw Exception(response.body['message']);
    }
  }
}

logRequestData(Response response) {
  log('Calling API: ${response.request!.url.toString()}');
  log('Headers: ${response.request!.headers}');
  log('Status Code: ${response.statusCode}');
  log('Response: ${response.bodyString}');
}
