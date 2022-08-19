import 'package:flutter_template/core/error/exception_handler.dart';
import 'package:flutter_template/core/platform/network_info.dart';
import 'package:flutter_template/src/data/datasource/login_local_datasource.dart';
import 'package:flutter_template/src/data/datasource/login_remote_datasource.dart';
import 'package:flutter_template/src/data/model/country_model.dart';
import 'package:flutter_template/src/data/model/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/region_model.dart';
import 'package:flutter_template/src/data/model/sector_model.dart';
import 'package:flutter_template/src/data/model/specialty_model.dart';
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
      String username, String password, bool rememberMe) async {
    if (await networkInfo.isConnected) {
      Get.log("login is connected");
      try {
        final res = await remoteDatasource.login(username, password);
        if (rememberMe) {
          await localDatasource.setToken(res);
        }
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

  @override
  Future<Either<Failure, CreateAccountModel>> createAccount(
    String username,
    String name,
    String? surname,
    String phone,
    String password,
    String? birthday, String gender, int? liveAddress, int? specialty,
  ) async {
    if (await networkInfo.isConnected) {
      Get.log("Create Account is connected");
      try {
        final res = await remoteDatasource.createAccount(
            username, name, surname, phone, password);
        await localDatasource.setUserData(res);
        await login(username, password, true);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        Get.log("Create Account failure $failure");
        return Left(failure);
      }
    } else {
      Get.log("Create Account disconnected");
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, RegionModel>> region(int countryId) async {
    if (await networkInfo.isConnected) {
      Get.log("get region is connected");
      try {
        final res = await remoteDatasource.region(countryId);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        Get.log("get region failure $failure");
        return Left(failure);
      }
    } else {
      Get.log("get region disconnected");
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, CountryModel>> country() async {
    if (await networkInfo.isConnected) {
      Get.log("get country is connected");
      try {
        final res = await remoteDatasource.country();
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        Get.log("get country failure $failure");
        return Left(failure);
      }
    } else {
      Get.log("get country disconnected");
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, SectorModel>> sector() async {
    {
      if (await networkInfo.isConnected) {
        Get.log("get sector is connected");
        try {
          final res = await remoteDatasource.sector();
          // await localDatasource.setSectorData(res);
          return Right(res);
        } catch (e) {
          final failure = handleException(e as Exception);
          Get.log("get sector failure $failure");
          return Left(failure);
        }
      } else {
        Get.log("get sector disconnected");
        return const Left(NetworkFailure());
      }
    }
  }

  @override
  Future<Either<Failure, SpecialityModel>> specialty(String sectorName) async {
    {
      if (await networkInfo.isConnected) {
        Get.log("get speciality is connected");
        try {
          final res = await remoteDatasource.specialty(sectorName);
          return Right(res);
        } catch (e) {
          final failure = handleException(e as Exception);
          Get.log("get speciality failure $failure");
          return Left(failure);
        }
      } else {
        Get.log("get speciality disconnected");
        return const Left(NetworkFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> reset(
      String newPassword, String confirmPassword) async {
    {
      if (await networkInfo.isConnected) {
        Get.log("Reset password is connected");
        try {
          final res =
              await remoteDatasource.reset(newPassword, confirmPassword);
          return Right(res);
        } catch (e) {
          final failure = handleException(e as Exception);
          Get.log("get speciality failure $failure");
          return Left(failure);
        }
      } else {
        Get.log("get speciality disconnected");
        return const Left(NetworkFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> sendPhone(String phoneNumber) async {
    {
      if (await networkInfo.isConnected) {
        Get.log("SendPhone password is connected");
        try {
          final res = await remoteDatasource.sendPhone(phoneNumber);
          return Right(res);
        } catch (e) {
          final failure = handleException(e as Exception);
          Get.log("SendPhone failure $failure");
          return Left(failure);
        }
      } else {
        Get.log("SendPhone disconnected");
        return const Left(NetworkFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> smsCode(String smsCode) async {
    {
      if (await networkInfo.isConnected) {
        Get.log("SendPhone password is connected");
        try {
          final res = await remoteDatasource.sendPhone(smsCode);
          return Right(res);
        } catch (e) {
          final failure = handleException(e as Exception);
          Get.log("SendPhone failure $failure");
          return Left(failure);
        }
      } else {
        Get.log("SendPhone disconnected");
        return const Left(NetworkFailure());
      }
    }
  }
}
