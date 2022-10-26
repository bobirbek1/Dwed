

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/app/app_constants.dart';
import 'package:flutter_template/core/network/dio_interceptors.dart';
import 'package:flutter_template/core/platform/network_info.dart';
import 'package:flutter_template/src/data/datasource/login_local_datasource.dart';
import 'package:flutter_template/src/data/datasource/login_remote_datasource.dart';
import 'package:flutter_template/src/data/repository/login_repo_impl.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';
import 'package:flutter_template/src/domain/usecase/create_account.dart';
import 'package:flutter_template/src/domain/usecase/get_country.dart';
import 'package:flutter_template/src/domain/usecase/get_region.dart';
import 'package:flutter_template/src/domain/usecase/get_sector.dart';
import 'package:flutter_template/src/domain/usecase/get_speciality.dart';
import 'package:flutter_template/src/domain/usecase/login.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/controller/login/login_controller.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/datasources/abstracts/local_datasource.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/datasources/abstracts/remote_datasource.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/datasources/impl/local_datasource.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/datasources/impl/remote_datasource.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/repositories/cart_repositoryImpl.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/change_amount_usecase.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/delete_item.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/get_card_products_impl.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/getitems_usecase.dart';
import 'package:flutter_template/src/presentation/pages/cart/presentation/controller/card_controller.dart';
import 'package:flutter_template/src/presentation/pages/checkout/presentation/controller/checkout_page_controller.dart';
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
  Get.lazyPut<CardLocalDataSource>(
          () => CardLocalDataSourceImpl(),
    fenix: true,
  );
  Get.lazyPut<CardRemoteDataSource>(
      () => CardRemoteDataSourceImpl(client: Get.find()),
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

  Get.lazyPut<CartRepository> (
      () => CardRepositoryImpl(
          cardRemoteDataSource: Get.find(),
          cardLocalDataSource: Get.find(),
          networkInfo: Get.find()),
    fenix: true);

  // usecase
  Get.lazyPut(() => Login(repo: Get.find()), fenix: true);
  Get.lazyPut(() => CreateAccount(repo: Get.find()), fenix: true);
  Get.lazyPut(() => GetSector(repo: Get.find()), fenix: true);
  Get.lazyPut(() => GetSpecialty(repo: Get.find()), fenix: true);
  Get.lazyPut(() => GetRegion(repo: Get.find()), fenix: true);
  Get.lazyPut(() => GetCountry(repo: Get.find()), fenix: true);
  Get.lazyPut(() => GetCardProductsImpl(cartRepository: Get.find()), fenix: true);
  Get.lazyPut(() => DeleteItemUseCase(cartRepository: Get.find()), fenix: true);
  Get.lazyPut(() => GetItemsUseCase(cartRepository: Get.find()), fenix: true);
  Get.lazyPut(() => DeleteItemUseCase(cartRepository: Get.find()), fenix: true);
  Get.lazyPut(() => ChangeAmountUseCase(cartRepository: Get.find()), fenix: true);

  // Controller
  Get.lazyPut(() => LoginController(login: Get.find()), fenix: true);
  Get.lazyPut(
      () =>
          CreateAccountController(createAccount: Get.find(), getSector: Get.find(),getSpecialty: Get.find(),getRegion: Get.find(),getCountry: Get.find(),),
      fenix: true);
  Get.lazyPut(
          () => CardController(getCardProducts: Get.find(), getItemsUseCase:  Get.find(), deleteItemUseCase:  Get.find(), changeAmountUseCase: Get.find()),
      fenix:  true);
  Get.lazyPut(
          () => CheckoutPageController(),
      fenix:  true);

}
