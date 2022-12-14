import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/model/others/country_model.dart';
import 'package:flutter_template/src/data/model/others/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/offers/offer_details_model.dart';
import 'package:flutter_template/src/data/model/others/region_model.dart';
import 'package:flutter_template/src/data/model/others/sector_model.dart';
import 'package:flutter_template/src/data/model/others/specialty_model.dart';
import 'package:flutter_template/src/data/model/others/token_model.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class LoginRemoteDatasource {
  Future<TokenModel> login(String username, String password);

  Future<TokenModel> refreshToken(String refreshToken);

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

  Future<OfferDetailsModel> getProductPageItem(String type, int id);

  Future<CountryModel> country();

  Future<SectorModel> sector();

  Future<SpecialityModel> specialty(String sectorName);

  Future<bool> updateAccount(
    String? birthday,
    String gender,
    int? liveAddress,
    int? specialty,
  );
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

  @override
  Future<bool> updateAccount(
    final String? birthday,
    final String gender,
    final int? specialty,
    final int? liveAddress,
  ) async {
    final data = FormData.fromMap({
      "birthday": birthday,
      "gender": gender,
      "main_cat_id": specialty,
      "region_id": liveAddress,
    });
    try {
      final result = await client.patch(
        "/v1.0/api/account/",
        data: data,
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
  Future<RegionModel> region(int countryId) async {
    try {
      final result = await client.get(
        "v1.0/api/regions/get_subs/$countryId/",
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
      final result = await client.get(
        "v1.0/api/regions/get_subs/0/",
        queryParameters: {"limit": 1000},
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
  Future<bool> sendPhone(String sendPhone) async {
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

  ///is called to get item for product page by slug_name and id
  @override
  Future<OfferDetailsModel> getProductPageItem(String type, int id) async {
    try {
      final result = await client.get('/v1.0/api/orgs/$type/offerings/$id/');
      final data = result.data;
      if (data != null) {
        Get.log("DetailsModelForProductPageItem remotedata result$data");
        return OfferDetailsModel.fromJson(data);
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<TokenModel> refreshToken(String refreshToken) async {
    try {
      final sendData = FormData.fromMap({"refresh": refreshToken});
      final result = await client.post('/v1.0/api/account/token-refresh/',data: sendData);
      final data = result.data;
      if (data != null) {
        Get.log("DetailsModelForProductPageItem remotedata result $data");
        return TokenModel.fromJson(data);
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }
}
