import 'dart:developer';
import 'package:get/get.dart';

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
