import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/app/app_constants.dart';
import 'package:flutter_template/core/platform/network_info.dart';
import 'package:get/instance_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// Dependency injection file

Future<void> init() async {
  final options = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: CONNECT_TIME_OUT,
    receiveTimeout: RECEIVE_TIME_OUT,
    sendTimeout: SEND_TIME_OUT,
    contentType: Headers.jsonContentType,
  );

  // External
  Get.put(Dio(options));
  Get.put(InternetConnectionChecker());
  Get.put(Connectivity());
  Get.put( NetworkInfoImpl(
        connectivity: Get.find(),
        dataChecker: Get.find(),
      ));


  //  Datasource

  // repository

  // usecase

  // Controller

}
