import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/app/app_constants.dart';
import 'package:flutter_template/core/network/dio_interceptors.dart';
import 'package:flutter_template/core/platform/network_info.dart';
import 'package:flutter_template/src/data/datasource/login_local_datasource.dart';
import 'package:flutter_template/src/data/datasource/login_remote_datasource.dart';
import 'package:flutter_template/src/data/repository/login_repo_impl.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';
import 'package:flutter_template/src/domain/usecase/login.dart';
import 'package:flutter_template/src/presentation/controller/login/login_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Dependency injection file

Future<void> init() async {
  final options = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: CONNECT_TIME_OUT,
    receiveTimeout: RECEIVE_TIME_OUT,
    sendTimeout: SEND_TIME_OUT,
    contentType: Headers.jsonContentType,
  );

  final prefs = await SharedPreferences.getInstance();

  // External
  Get.put(addInterceptor(Dio(options)));
  Get.put(InternetConnectionChecker());
  Get.put(Connectivity());
  Get.put(prefs);
  Get.put<NetworkInfo>(NetworkInfoImpl(
    connectivity: Get.find(),
    dataChecker: Get.find(),
  ));

  //  Datasource
  Get.lazyPut<LoginLocalDatasource>(
    () => LoginLocalDatasourceImpl(prefs: Get.find()),
    fenix: true,
  );
  Get.lazyPut<LoginRemoteDatasource>(
    () => LoginRemoteDatasourceImpl(client: Get.find()),
    fenix: true,
  );

  // repository
  Get.lazyPut<LoginRepo>(
      () => LoginRepoImpl(
            localDatasource: Get.find(),
            networkInfo: Get.find(),
            remoteDatasource: Get.find(),
          ),
      fenix: true);

  // usecase
  Get.lazyPut(() => Login(repo: Get.find()), fenix: true);

  // Controller
  Get.lazyPut(() => LoginController(login: Get.find()), fenix: true);
}
