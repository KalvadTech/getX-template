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
      : super(message ?? "", tkApiError);
}

class NetworkException extends AppException {
  NetworkException([String? message])
      : super(message ?? "", tkNetworkError);
}

class FetchingException extends AppException {
  FetchingException([String? message])
      : super(message ?? "", tkFetchingError);
}