import 'package:dio/dio.dart';
import 'package:radsync_flutter/modules/api/auth_interceptor.dart';

import '../../models/constants.dart';
import '../../models/waste/filter.dart';
import '../../models/waste/request.dart';

class WasteRequestService {
  Future<WasteRequestResponse> getPendingRequests(WasteRequestFilter filter) async {
    Dio dio = getDioClient();
    final url = "${Constants.host}/api/waste-request/pending";
    final response = await dio.post(url, data: filter.toJson());

    if (response.statusCode == 200) {
      final data = WasteRequestResponse.fromJson(response.data);
      return data;
    } else {
      throw Exception("Failed to get pending waste requests from API");
    }
  }

  Dio getDioClient() {
    final options = BaseOptions(connectTimeout: 5000);
    final dio = Dio(options);
    dio.interceptors.add(AuthInterceptor());
    return dio;
  }
}
