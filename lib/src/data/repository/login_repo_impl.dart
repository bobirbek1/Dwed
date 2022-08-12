import 'package:flutter_template/core/error/exception_handler.dart';
import 'package:flutter_template/core/platform/network_info.dart';
import 'package:flutter_template/src/data/datasource/login_local_datasource.dart';
import 'package:flutter_template/src/data/datasource/login_remote_datasource.dart';
import 'package:flutter_template/src/data/model/token_model.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';
import 'package:get/instance_manager.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDatasource remoteDatasource;
  final LoginLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  LoginRepoImpl(
      {required this.remoteDatasource,
      required this.localDatasource,
      required this.networkInfo});

  @override
  Future<Either<Failure, TokenModel>> login(
      String username, String password) async {
    if (await networkInfo.isConnected) {
      Get.log("login is connected");
      try {
        final res = await remoteDatasource.login(username, password);
        await localDatasource.setToken(res);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        Get.log("login failure $failure");
        return Left(failure);
      }
    } else {
      Get.log("login disconnected");
      return const Left(NetworkFailure());
    }
  }
}
