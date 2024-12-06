import 'package:flutter/foundation.dart';
import 'package:sentry/sentry.dart';

/// Enum to represent the status of an API call.
enum ApiStatus { idle, loading, success, fail }

/// Class to encapsulate the response of an API call.
class ApiResponse<E> {
  E? data; // Data returned by the API.
  Exception? exception; // Exception if the API call fails.
  ApiStatus status; // Status of the API call.

  /// Private constructor for ApiResponse.
  ApiResponse._({this.data, this.exception, this.status = ApiStatus.idle});

  /// Factory constructor for idle status.
  factory ApiResponse.idle() => ApiResponse._();

  /// Factory constructor for loading status.
  factory ApiResponse.loading() => ApiResponse._(status: ApiStatus.loading);

  /// Factory constructor for success status.
  factory ApiResponse.success(E data) => ApiResponse._(data: data, status: ApiStatus.success);

  /// Factory constructor for fail status.
  factory ApiResponse.fail(Exception exception) => ApiResponse._(exception: exception, status: ApiStatus.fail);

  /// Checks if the status is loading.
  bool isLoading() => status == ApiStatus.loading;

  /// Checks if there is an exception.
  bool hasException() => exception != null;

  /// Checks if there is data.
  bool hasData() => data != null;
}

/// Function to handle API calls and yield ApiResponse states.
///
/// `callback`: The asynchronous function to execute.
/// `withLoading`: Whether to yield a loading state before the call (default is `true`).
Stream<ApiResponse<E>> apiFetch<E>(Future<E> callback, [bool withLoading = true]) async* {
  try {
    if (withLoading) {
      yield ApiResponse<E>.loading();
    }
    E data = await callback;
    yield ApiResponse.success(data);
  } catch (e, stackTrace) {
    yield ApiResponse<E>.fail(Exception(e.toString()));
    if (kDebugMode) {
      print('Exception: $e');
      print('StackTrace: $stackTrace');
    }
    await Sentry.captureException(
      e,
      stackTrace: stackTrace,
    );
  }
}

/// Class to encapsulate a paginated response.
///
/// `E`: The type of data returned by the API.
class PaginationResponse<E> {
  final E data; // Data returned by the API.
  final int totalRows; // Total number of rows available.

  PaginationResponse(this.data, this.totalRows);
}
