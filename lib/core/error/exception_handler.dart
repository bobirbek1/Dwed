import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:get/instance_manager.dart';

Failure handleException(Exception e) {
  if (e is DioError) {
    Get.log("response is ${e.response?.data}");
    final errorMessage = e.response?.data["errors"].isNotEmpty
        ? e.response?.data["errors"].first["message"]
        : null;
    switch (e.type) {
      case DioErrorType.cancel:
        return ServerCancelFailure(message: errorMessage);
      case DioErrorType.response:
        if (e.response?.statusCode == 401) {
          return ServerUnAuthorizeFailure(message: errorMessage);
        } else if (e.response?.statusCode == 404) {
          return ServerNotFoundFailure(message: errorMessage);
        } else {
          return ServerUnknownFailure(message: errorMessage);
        }
      case DioErrorType.other:
        return ServerUnknownFailure(message: errorMessage);
      default:
        return ServerTimeOutFailure(message: errorMessage);
    }
  } else {
    return ServerUnknownFailure(message: e.toString());
  }
}
