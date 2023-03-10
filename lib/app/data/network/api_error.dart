import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Something went wrong, please try later.";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;

  String _handleError(int statusCode, dynamic error) {
    Get.log('error statusCode: $statusCode');
    switch (statusCode) {
      case 111:
        return 'Hmmmm';
      case 013:
        return 'phone Number In Use';
      case 400:
        return error["message"];
      case 401:
        return error["message"];
      case 403:
        return error["message"];
      case 404:
        return error["message"];
      case 422:
        return error["message"];
      case 500:
        return 'Internal server error';
      case 504:
        return 'Your request has timed out.';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
