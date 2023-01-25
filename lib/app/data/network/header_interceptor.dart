import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;

import '../../routes/app_pages.dart';

class HeaderInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Accept": "application/json",
      "Content-Type": "application/json",
      // "Authorization": "Bearer $token",
    });

    if (options.uri.toString().contains('user-profile-by-id')) {
      const token = 'authorization';
      options.headers.addAll({
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
    }

    if (options.uri.toString().contains('edit-profile-avatar')) {
      const token = 'authorization';
      options.headers.addAll({
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
        "Authorization": "Bearer $token",
      });
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 404) {
      // get_x.Get.to(() => const UnknownRoute());
    } else if (err.response?.statusCode == 401 &&
        get_x.Get.currentRoute != Routes.AUTH) {
      get_x.Get.offAllNamed(Routes.AUTH);
    }
    return super.onError(err, handler);
  }
}
