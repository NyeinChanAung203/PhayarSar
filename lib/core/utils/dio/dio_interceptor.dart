import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggerInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('❌ Dio Error!');
    debugPrint('❌ Url: ${err.requestOptions.uri} ❌${err.response?.statusCode}');
    debugPrint('❌ ${err.stackTrace}');
    debugPrint('❌ Response Error: ${err.response?.data}');

    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('🌍 Sending network request: ${options.baseUrl}${options.path}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('⬅️ Received network response');
    debugPrint(
        '${response.statusCode != 200 ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅'} ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    debugPrint('Query params: ${response.requestOptions.queryParameters}');
    debugPrint('Response Data: ${response.data}');
    debugPrint('------------------------- ');

    return handler.next(response);
  }
}
