import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CustomDio {
  Dio getApiDio() {
    var options = BaseOptions(
      baseUrl: 'https://henri-potier.techx.fr',
    );
    return Dio(options)
      ..interceptors.add(
        LogInterceptor(
          responseBody: kDebugMode,
          requestHeader: kDebugMode,
          requestBody: kDebugMode,
        ),
      );
  }
}
