import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/model/country_model.dart';
import 'package:flutter_template/src/data/model/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/region_model.dart';
import 'package:flutter_template/src/data/model/sector_model.dart';
import 'package:flutter_template/src/data/model/specialty_model.dart';
import 'package:flutter_template/src/data/model/token_model.dart';

abstract class LoginRemoteDatasource {
  Future<TokenModel> login(String username, String password);
  Future<bool> reset(String newPassword, String confirmPassword);
  Future<bool> sendPhone(String sendPhone);
  Future<bool> smsCode(String smsCode);

  Future<CreateAccountModel> createAccount(
    String username,
    String name,
    String? surname,
    String phone,
    String password,
  );
  // Future<CreateAccountModel> specialty(String specilaty);
  Future<RegionModel> region(int countryId);
  Future<CountryModel> country();
  Future<SectorModel> sector();
  Future<SpecialityModel> specialty(String sectorName);
}

class LoginRemoteDatasourceImpl extends LoginRemoteDatasource {
  final Dio client;

  LoginRemoteDatasourceImpl({required this.client});

  @override
  Future<TokenModel> login(String username, String password) async {
    final data = FormData.fromMap({"username": username, "password": password});
    try {
      final result = await client.post(
        "v1.0/api/account/login/",
        data: data,
      );
      return TokenModel.fromJson(result.data);
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<CreateAccountModel> createAccount(
    String username,
    String name,
    String? surname,
    String phone,
    String password,
  ) async {
    final data = FormData.fromMap({
      "username": username,
      "name": name,
      "surname": surname,
      "phone": phone,
      "password": password
    });
    try {
      final result = await client.post(
        "/v1.0/api/account/create/",
        data: data,
      );
      return CreateAccountModel.fromJson(result.data);
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  Future<CreateAccountModel> updateAccount(
    final String birthday,
    final String gender,
    final String specialty,
    final String liveAddress,
  ) async {
    final data = FormData.fromMap({
      "birthday": birthday,
      "gender": gender,
      "specialty": specialty,
      "liveAddress": liveAddress,
    });
    try {
      final result = await client.patch(
        "/v1.0/api/account/create/",
        data: data,
      );
      return CreateAccountModel.fromJson(result.data);
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<RegionModel> region(int countryId) async {
    try {
      final result = await client.patch(
        "/v1.0/api/account/create/",
      );
      return RegionModel.fromJson(result.data);
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<CountryModel> country() async {
    try {
      final result = await client.patch(
        "/v1.0/api/account/create/",
      );
      return CountryModel.fromJson(result.data);
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<SectorModel> sector() async {
    try {
      final result = await client.get("v1.0/api/cats/ucats/get_subs/0/",
          queryParameters: {"limit": 1000, "show_empties": 1});
      return SectorModel.fromJson(result.data);
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<SpecialityModel> specialty(String sectorName) async {
    try {
      final result = await client.get(
        "v1.0/api/cats/ucats/get_subs/$sectorName/",
        queryParameters: {"limit": 1000, "show_empties": 1},
      );
      return SpecialityModel.fromJson(result.data);
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<bool> reset(String newPassword, String confirmPassword) async {
    try {
      final result = await client.get(
        "v1.0/api/cats/ucats/get_subs/$newPassword/",
      );
      return true;
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<bool> sendPhone(String sendPhone)async {
    try {
      final result = await client.get(
        "v1.0/api/cats/ucats/get_subs/$sendPhone/",
      );
      return true;
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<bool> smsCode(String smsCode) async {
    try {
      final result = await client.get(
        "v1.0/api/cats/ucats/get_subs/$smsCode/",
      );
      return true;
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }
}
