import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class ErrorHandler {
  ErrorHandler._();
  static String getErrorMessage(Object? error) {
    log('error type => ${error.runtimeType}');
    String errorMessage = 'Something went wrong!';
    if (error is DioException) {
      DioException e = error;
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          errorMessage =
              'Please check your internet connection and try again later.';
          break;
        case DioExceptionType.badResponse:
          errorMessage = e.response?.statusCode != null
              ? e.response!.statusCode! >= 500
                  ? 'Server Error'
                  : e.response?.data['message'] ?? 'Invalid Response'
              : 'Invalid Response';
          break;
        case DioExceptionType.cancel:
          errorMessage =
              'The connection was terminated before completion. Please ensure stable network connectivity and try again.';
          break;
        case DioExceptionType.unknown:
          if (e.error is SocketException) {
            errorMessage = 'Check your internet connection!';
          } else {
            errorMessage = e.message ?? 'Something went wrong!';
          }
          break;
        default:
          errorMessage = 'Something went wrong!!';
          break;
      }
    } else if (error is TypeError) {
      errorMessage =
          'An unexpected data type was encountered.\nPlease check your input and try again.';
    } else if (error is SocketException) {
      errorMessage = 'Check your internet connection!';
    }
    return errorMessage;
  }
}
