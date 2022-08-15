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

  Future<CreateAccountModel> createAccount(
    String username,
    String name,
    String? lastname,
    String? surname,
    String phone,
    String password,
  );
  // Future<CreateAccountModel> specialty(String specilaty);
  Future<RegionModel> region(String region);
  Future<CountryModel> country(String country);
  Future<SectorModel> sector(String sector);
  Future<SpecialtyModel> specialty(String specialty);
}

class LoginRemoteDatasourceImpl extends LoginRemoteDatasource {
  final Dio client;

  LoginRemoteDatasourceImpl({required this.client});

  @override
  Future<TokenModel> login(String username, String password) async {
    final data = FormData.fromMap({"username": username, "password": password});
    try {
      final result = await client.post(
        "/v1.0/api/account/login/",
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
    String? lastname,
    String? surname,
    String phone,
    String password,
  ) async {
    final data = FormData.fromMap({
      "username": username,
      "name": name,
      "lastname": lastname,
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
  Future<RegionModel> region(String region)async {
    final data = FormData.fromMap({
      "liveAddress": region,
    });
    try {
      final result = await client.patch(
        "/v1.0/api/account/create/",
        data: data,
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
  Future<CountryModel> country(String country)async {
    final data = FormData.fromMap({
      "country": country,
    });
    try {
      final result = await client.patch(
        "/v1.0/api/account/create/",
        data: data,
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
  Future<SectorModel> sector(String sector) async {
    final data = FormData.fromMap({
      "sector": sector,
    });
    try {
      final result = await client.patch(
        "/v1.0/api/account/create/",
        data: data,
      );
      return SectorModel.fromJson(result.data);
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<SpecialtyModel> specialty(String specialty) async {
    final data = FormData.fromMap({
      "specialty": specialty,
    });
    try {
      final result = await client.patch(
        "/v1.0/api/account/create/",
        data: data,
      );
      return SpecialtyModel.fromJson(result.data);
    } catch (e) {
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

}
