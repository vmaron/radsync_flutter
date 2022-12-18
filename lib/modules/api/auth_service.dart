import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:radsync_flutter/modules/api/auth_interceptor.dart';

import '../../models/auth_token.dart';
import '../../models/constants.dart';
import '../tools/secure_storage.dart';

class AuthService {
  SecureStorage secStore = SecureStorage();

  Future<AuthToken> fetchAuthToken(String token) async {
    Dio dio = getDioClient();
    final url = "${Constants.host}/api/auth/$token";
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final authToken = AuthToken.fromJson(response.data);
      secStore.secureWrite('token', authToken.jwt?.token ?? "");
      return authToken;
    } else {
      throw Exception("Failed to get data from API");
    }
  }

  Dio getDioClient() {
    final options = BaseOptions(connectTimeout: 5000);
    final dio = Dio(options);
    dio.interceptors.add(AuthInterceptor());
    return dio;
  }
}
