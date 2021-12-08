import 'keys.dart';

class AppException implements Exception {
  final String message;
  final String prefix;

  AppException([this.message = "", this.prefix = ""]);

  @override
  String toString() {
    return "$prefix: $message";
  }
}

class APIException extends AppException {
  APIException([String? message])
      : super(message ?? "", apiErrorTitle);
}

class NetworkException extends AppException {
  NetworkException([String? message])
      : super(message ?? "", networkErrorTitle);
}

class FetchingException extends AppException {
  FetchingException([String? message])
      : super(message ?? "", fetchingErrorTitle);
}