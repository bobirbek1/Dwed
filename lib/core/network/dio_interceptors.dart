// import 'dart:async';
// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import 'package:flutter_template/src/data/datasource/login_local_datasource.dart';
// import 'package:flutter_template/src/data/datasource/login_remote_datasource.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Dio addInterceptor(Dio dio) {
  // final tokenHelper = Get.find<RefreshTokenHelper>();
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      // final token = tokenHelper.getToken();
      // if (token != null) {
        options.headers['Authorization'] = "Bearer ";
        Get.log("options  headers is ${options.headers}");
        return handler.next(options);
      // }
      // return handler.next(options);
    },
    // onError: (e, handler) async {
    //   if ((e.response?.statusCode == 403 || e.response?.statusCode == 401)) {
    //     final isTokenRefreshed = await tokenHelper.updateToken().future;
    //     Get.log("isTokenRefreshed: $isTokenRefreshed");
    //     if (isTokenRefreshed) {
    //       return handler.resolve(
    //         await _retry(e.requestOptions),
    //       );
    //     } else {
    //       return handler.next(e);
    //     }
    //   }
    //   return handler.next(e);
    // },
  ));
  return dio;
}

// _retry(RequestOptions requestOptions) {
//   final client = Get.find<Dio>();
//   final options = Options(
//     method: requestOptions.method,
//     headers: requestOptions.headers,
//   );
//   Get.log("dio client options base url is ${client.options.baseUrl}");
//   return client.request(
//     requestOptions.path,
//     data: requestOptions.data,
//     queryParameters: requestOptions.queryParameters,
//     options: options,
//   );
// }

// class RefreshTokenHelper {
//   final requests = <Completer<bool>>[];
//   bool isRefreshing = false;

//   Completer<bool> updateToken() {
//     final completer = Completer<bool>();
//     final time = _getLastTokenUpdate();
//     requests.add(completer);
//     if (!isRefreshing) {
//       isRefreshing = true;
//       _updateToken();
//     }
//     return completer;
//   }

//   Future<bool> _updateToken() async {
//     final LoginLocalDatasource localDatasource = Get.find();
//     final LoginRemoteDatasource remoteDatasource = Get.find();

//     try {
//       final lastToken = await localDatasource.getToken();
//       final url = await localDatasource.getBaseUrl();
//       if (url == null) return false;
//       Get.log("last token is ${lastToken.toString()}");
//       final newToken =
//           await remoteDatasource.refreshToken(url, lastToken.refreshToken!);
//       await localDatasource.saveToken(newToken);
//       await localDatasource.saveUpdateTokenTime(DateTime.now());
//       completeRefesh(true);
//       Get.printInfo(info: "Token has been refreshed $newToken");
//       return true;
//     } catch (e) {
//       if (e is DioError) {
//         Get.printError(info: "Token refresh failed ${e.response}");
//       } else {
//         Get.printError(info: "Token refresh failed $e");
//       }
//       completeRefesh(false);
//       return false;
//     }
//   }

//   void completeRefesh(bool isRefreshed) {
//     isRefreshing = false;
//     for (var element in requests) {
//       element.complete(isRefreshed);
//     }
//     requests.clear();
//   }

//   TokenModel? getToken() {
//     final prefs = Get.find<SharedPreferences>();
//     final tokenJson = prefs.getString(AppConstants.KEY_TOKEN);
//     if (tokenJson != null) {
//       return TokenModel.fromJson(
//         json.decode(tokenJson),
//       );
//     }
//     return null;
//   }

//   DateTime? _getLastTokenUpdate() {
//     final prefs = Get.find<SharedPreferences>();
//     final tokenUpdatTime =
//         prefs.getString(AppConstants.KEY_LAST_TOKEN_UPDATE_TIME);
//     return tokenUpdatTime != null ? DateTime.parse(tokenUpdatTime) : null;
//   }
// }