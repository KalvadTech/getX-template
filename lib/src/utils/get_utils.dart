import 'dart:developer';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Utils {

  static Future<T> isolator<T>(T Function() function) async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn((message) {
      T result = function();
      Isolate.exit(message as SendPort?, result);
    }, receivePort.sendPort);
    return await receivePort.first as T;
  }

  static void handleError(Response response) {
    if (response.hasError) {
      if (response.status.isNotFound) {
        throw Exception(response.statusText);
      } else {
        throw Exception(response.body['message']);
      }
    }
  }

  static void logRequestData(Response response) {
    log('Calling API: ${response.request!.url.toString()}');
    log('Headers: ${response.request!.headers}');
    log('Status Code: ${response.statusCode}');
    log('Response: ${response.bodyString}');
  }


  static Future actionHandler(BuildContext context, AsyncCallback action) async {
    context.loaderOverlay.show();
    try {
      await action();
    } on AppException catch (e, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
        log(e.toString());
      }
      Get.snackbar(e.prefix.tr, e.message.tr);
      // await Sentry.captureException(
      //     e,
      //     stackTrace: stackTrace,
      //     hint: '${e.prefix.tr}: ${e.message.tr}'
      // );
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
        log(e.toString());
      }
      // await Sentry.captureException(
      //   e,
      //   stackTrace: stackTrace,
      //   hint: e.toString(),
      // );
      Get.snackbar(tkError, tkSomethingWentWrongMsg.tr);
    } finally {
      context.loaderOverlay.hide();
    }
  }

  static Future exceptionHandler(AsyncCallback action) async {
    try {
      await action();
    } on AppException catch (e, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
        log(e.toString());
      }
      Get.snackbar(e.prefix.tr, e.message.tr);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
        log(e.toString());
      }
      Get.snackbar(tkError, tkSomethingWentWrongMsg.tr);
    }
  }

}



