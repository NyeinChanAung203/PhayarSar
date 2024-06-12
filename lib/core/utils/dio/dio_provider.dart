import 'package:dio/dio.dart';
import 'package:phayarsar/core/utils/dio/dio_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dioProvider(DioProviderRef ref) {
  Dio dio = Dio(
    BaseOptions(
        baseUrl:
            'https://raw.githubusercontent.com/NyeinChanAung203/PhayarSar/master/data',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Cache-Control': 'no-cache',
        }),
  );
  dio.interceptors.add(LoggerInterceptor());
  return dio;
}
