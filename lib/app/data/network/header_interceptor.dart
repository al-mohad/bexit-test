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

    // if (Apis.minderTypes.any((p) => options.uri.toString().contains(p))) {
    //   // final token = await cacheService.retrieveUserToken();
    //   // options.headers.addAll({
    //   //   "Accept": "application/json",
    //   //   "Content-Type": "application/json",
    //   //   "Authorization": "Bearer $token",
    //   // });

    //   // options.baseUrl = '${options.baseUrl}?platform=$userDevice&type=minder';
    // }

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
