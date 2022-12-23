// import 'dart:async';
// import 'dart:convert';

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_template/app/app_constants.dart';
import 'package:flutter_template/src/data/datasource/login/login_local_datasource.dart';
import 'package:flutter_template/src/data/datasource/login/login_remote_datasource.dart';
import 'package:flutter_template/src/data/model/others/token_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio addInterceptor(Dio dio) {
  final token1 = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcxNzAxNjU3LCJqdGkiOiJmYTdhNDE5MmRhMWQ0MzU5ODQ2YTdhOGE2YmU5NjMyMSIsInVzZXJuYW1lIjoiYm9iaXJiZWsifQ.fJYjV6m7K1X8T3cPXTZZZ-jLrq6TaS3O0U3oHYkgWJY';
  final tokenHelper = Get.find<RefreshTokenHelper>();
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      options.headers['Authorization'] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcyNDE0OTMwLCJqdGkiOiJjNzBiNmY5NTVmY2I0ODQ5YmQyNzQyOTU5MjRjNGNiZCIsInVzZXJuYW1lIjoiYm9iaXJiZWsifQ.VrVvHefUw0n2wDV7rk0ggHi1tyQhG61g9srI9QmQ3gE";
      Get.log("options  headers is ${options.headers}");
      return handler.next(options);
      // final token = tokenHelper.getToken();
      // if (token != null) {
      //   options.headers['Authorization'] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcyMDc1NzYzLCJqdGkiOiJiMzQ1ZWQ1NDQ2N2Y0ZDBmOWFhMmI2ZjAwOGE3Yzg2NiIsInVzZXJuYW1lIjoiYm9iaXJiZWsifQ.cqwygUciaBHbYXk8FiuOF__pLoNCyJE-D3HTmo4mmfg";
      //   Get.log("options  headers is ${options.headers}");
      //   return handler.next(options);
      // }
      return handler.next(options);
    },
    onError: (e, handler) async {
      if ((e.response?.statusCode == 403 || e.response?.statusCode == 401)) {
        final isTokenRefreshed = await tokenHelper.updateToken().future;
        Get.log("isTokenRefreshed: $isTokenRefreshed");
        if (isTokenRefreshed) {
          return handler.resolve(
            await _retry(e.requestOptions),
          );
        } else {
          return handler.next(e);
        }
      }
      return handler.next(e);
    },
  ));
  return dio;
}

_retry(RequestOptions requestOptions) {
  final client = Get.find<Dio>();
  final options = Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
  );
  Get.log("dio client options base url is ${client.options.baseUrl}");
  return client.request(
    requestOptions.path,
    data: requestOptions.data,
    queryParameters: requestOptions.queryParameters,
    options: options,
  );
}

class RefreshTokenHelper {
  final requests = <Completer<bool>>[];
  bool isRefreshing = false;

  Completer<bool> updateToken() {
    final completer = Completer<bool>();
    requests.add(completer);
    if (!isRefreshing) {
      isRefreshing = true;
      _updateToken();
    }
    return completer;
  }

  Future<bool> _updateToken() async {
    final LoginLocalDatasource localDatasource = Get.find();
    final LoginRemoteDatasource remoteDatasource = Get.find();

    try {
      final lastToken = await localDatasource.getToken();
      Get.log("last token is ${lastToken.toString()}");
      final newToken = await remoteDatasource.refreshToken(lastToken.refresh!);
      await localDatasource.setToken(newToken);
      completeRefesh(true);
      Get.printInfo(info: "Token has been refreshed $newToken");
      return true;
    } catch (e) {
      if (e is DioError) {
        Get.printError(info: "Token refresh failed ${e.response}");
      } else {
        Get.printError(info: "Token refresh failed $e");
      }
      completeRefesh(false);
      return false;
    }
  }

  void completeRefesh(bool isRefreshed) {
    isRefreshing = false;
    for (var element in requests) {
      element.complete(isRefreshed);
    }
    requests.clear();
  }

  TokenModel? getToken() {
    final prefs = Get.find<SharedPreferences>();
    final tokenJson = prefs.getString(keyToken);
    if (tokenJson != null) {
      return TokenModel.fromJson(
        json.decode(tokenJson),
      );
    }
    return null;
  }
}
