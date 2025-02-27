import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpServiceHelper {
  static Duration requestDuration = const Duration(seconds: 50);

  static BaseOptions options() {
    return BaseOptions(
      receiveTimeout: requestDuration,
      sendTimeout: requestDuration,
      connectTimeout: requestDuration,
      baseUrl: 'http://209.250.237.58:5031/api',
      followRedirects: false,
      validateStatus: (status) => status! <= 500,
    );
  }

  static InterceptorsWrapper buildInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        log('${options.method} ${options.uri}');
        handler.next(options);
      },
      onError: (error, handler) {
        log('Error: ${error.response?.statusCode}');
        handler.next(error);
      },
      onResponse: (response, handler) {
        log('Response: ${response.statusCode}');
        handler.next(response);
      },
    );
  }

  static PrettyDioLogger buildPrettyDioLoggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      maxWidth: 90,
    );
  }
}
