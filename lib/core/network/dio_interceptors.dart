// import 'dart:async';
// import 'dart:convert';

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_template/app/app_constants.dart';
import 'package:flutter_template/src/data/datasource/login/login_local_datasource.dart';
import 'package:flutter_template/src/data/datasource/login/login_remote_datasource.dart';
import 'package:flutter_template/src/data/model/token_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio addInterceptor(Dio dio) {
  final tokenHelper = Get.find<RefreshTokenHelper>();
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = tokenHelper.getToken();
      if (token != null) {
        options.headers['Authorization'] = "Bearer ${token.access}";
        Get.log("options  headers is ${options.headers}");
        return handler.next(options);
      }
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
