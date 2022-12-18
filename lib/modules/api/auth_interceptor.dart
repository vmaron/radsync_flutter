import 'package:dio/dio.dart';

import '../tools/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  SecureStorage secStore = SecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final String token = await secStore.secureRead("token");
    if (token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    options.headers["Accept"] = "application/json";
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }

  bool isTokenExpired(DateTime expiryDate) {
    bool isExpired = expiryDate.compareTo(DateTime.now()) < 0;
    return isExpired;
  }
}
