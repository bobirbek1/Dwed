import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exception_handler.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/model/country_model.dart';
import 'package:flutter_template/src/data/model/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/details_model_for_products_page.dart';
import 'package:flutter_template/src/data/model/offers_details_model.dart';
import 'package:flutter_template/src/data/model/offers_model.dart';
import 'package:flutter_template/src/data/model/organisation_details_model.dart';
import 'package:flutter_template/src/data/model/organisation_model.dart';
import 'package:flutter_template/src/data/model/region_model.dart';
import 'package:flutter_template/src/data/model/sector_model.dart';
import 'package:flutter_template/src/data/model/specialty_model.dart';
import 'package:flutter_template/src/data/model/token_model.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class LoginRemoteDatasource {
  Future<TokenModel> login(String username, String password);

  Future<bool> reset(String newPassword, String confirmPassword);

  Future<bool> sendPhone(String sendPhone);

  Future<bool> smsCode(String smsCode);

  Future<CreateAccountModel> createAccount(String username,
      String name,
      String? surname,
      String phone,
      String password,);

  // Future<CreateAccountModel> specialty(String specilaty);
  Future<RegionModel> region(int countryId);

  Future<Map<String, dynamic>> organisation(int offset);

  Future<Map<String, dynamic>> organisationSub(int offset, String category);

  Future<List<OrganisationDetailsModel>> organisationDetails(String slugName,
      int offset);

  Future<OrganisationModel> organisationUSerPost(String slugName);

  Future<Map<String, dynamic>> offers(int offset);

  Future<Map<String, dynamic>> offersChild(int id, int offset);

  Future<Map<String, dynamic>> offersDetails(int id, int offset);

  Future<DetailsModelForProductsPage> getProductPageItem(String type, int id);

  Future<CountryModel> country();

  Future<SectorModel> sector();

  Future<SpecialityModel> specialty(String sectorName);

  Future<bool> updateAccount(String? birthday,
      String gender,
      int? liveAddress,
      int? specialty,);
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
  Future<CreateAccountModel> createAccount(String username,
      String name,
      String? surname,
      String phone,
      String password,) async {
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
  Future<bool> updateAccount(final String? birthday,
      final String gender,
      final int? specialty,
      final int? liveAddress,) async {
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

  @override
  Future<Map<String, dynamic>> organisation(int offset) async {
    Map<String, String> qParams = {
      'offset': '$offset',
      'limit': '10'
    };
    try {
      final result = await client.get(
          "v1.0/api/orgs/", queryParameters: qParams
      );
      final data = result.data;
      Get.log("Organisation remotedata result$data");
      if (data != null) {
        final list = data["results"].map<OrganisationModel>((e) {
          Get.log("Organisation map => $e}");
          Get.log("Organisation map from =>${OrganisationModel.fromJson(e)}");
          return OrganisationModel.fromJson(e);
        }).toList();
        return {'results': list, 'next': data['next'] != null ? true : false};
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> organisationSub(int offset,
      String category) async {
    Map<String, String> qParams = {
      'category': category,
      'offset': '$offset',
      'limit': '10'
    };
    try {
      final result = await client.get(
          "v1.0/api/orgs/", queryParameters: qParams
      );
      final data = result.data;
      Get.log("Organisation remotedata result$data");
      if (data != null) {
        final list = data["results"].map<OrganisationModel>((e) {
          Get.log("Organisation map => $e}");
          Get.log("Organisation map from =>${OrganisationModel.fromJson(e)}");
          return OrganisationModel.fromJson(e);
        }).toList();
        return {'results': list, 'next': data['next'] != null ? true : false};
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<OrganisationModel> organisationUSerPost(String slugName) async {
    try {
      final result = await client.get('/v1.0/api/orgs/$slugName/');
      final data = result.data;
      Get.log("user post page item = > $data");
      if (data != null) {
        return data;
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
  Future<Map<String, dynamic>> offers(int offset) async {
    Map<String, String> qParams = {
      'offset': '$offset',
      'limit': '10'
    };
    try {
      final result = await client.get(
          "v1.0/api/cats/offers_cats/get_subs/0/", queryParameters: qParams
      );
      final data = result.data;
      Get.log("Offers remotedata result$data");
      if (data != null) {
        final list = data["results"].map<OffersModel>((e) {
          Get.log("Offers map => $e}");
          Get.log("Offers map from =>${OffersModel.fromJson(e)}");
          return OffersModel.fromJson(e);
        }).toList();
        return {'results': list, 'next': data['next'] ?? false};
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> offersChild(int id, int offset) async {
    Map<String, String> qParams = {
      'offset': '$offset',
      'limit': '10'
    };

    try {
      final result = await client.get(
          "v1.0/api/cats/offers_cats/get_subs/$id/", queryParameters: qParams
      );
      final data = result.data;
      if (data != null) {
        Get.log("OffersChild remotedata result${data["results"].toString()}");
        final list = data["results"].map<OffersModel>((e) {
          Get.log("OffersChild map => $e}");
          Get.log("OffersChild map from =>${OffersModel.fromJson(e)}");
          return OffersModel.fromJson(e);
        }).toList();
        return {'results': list, 'next': data['next'] ?? false};
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> offersDetails(int id, int offset) async {
    Map<String, String> qParams = {
      'limit': '20',
      'offer_cat': '$id',
      'offset': '$offset'
    };

    try {
      final result = await client.get(
          "v1.0/api/offerings/", queryParameters: qParams
      );
      final data = result.data;
      if (data != null) {
        Get.log("OffersDetails remotedata result${data["results"].toString()}");
        final list = data["results"].map<OffersDetailsModel>((e) {
          Get.log("OffersDetails map => $e}");
          Get.log("OffersDetails map from =>${OffersDetailsModel.fromJson(e)}");
          return OffersDetailsModel.fromJson(e);
        }).toList();
        return {'results': list, 'next': data['next'] ?? false};
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  ///is called to get item for product page item by slug_name and id
  @override
  Future<DetailsModelForProductsPage> getProductPageItem(String type,
      int id) async {
    try {
      final result = await client.get('/v1.0/api/orgs/$type/offerings/$id/');
      final data = result.data;
      if (data != null) {
        Get.log(
            "DetailsModelForProductPageItem remotedata result${data["results"]
                .toString()}");
        Get.log(
            "DetailsModelForProductPageItem map from =>${DetailsModelForProductsPage
                .fromJson(data)}");
        return DetailsModelForProductsPage.fromJson(data);
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
  Future<List<OrganisationDetailsModel>> organisationDetails(String slugName,
      int offset) async {
    Get.log('organisation details called');
    try {
      final result = await client.get(
          '/v1.0/api/orgs/$slugName/offerings/?limit=15&offset=$offset');
      Get.log('organisation details result => ${result}');
      final data = result.data;
      if (data != null) {
        Get.log('organisation details result data => ${result}');
        final res = data['results'].map<OrganisationDetailsModel>((e) {
          Get.log("organisation model list item  => $e");
          Get.log("organisation model list item from json => ${OrganisationDetailsModel.fromJson(e)}");
          return OrganisationDetailsModel.fromJson(e);
        }).toList();
        return res;
      }
      throw ServerUnknownException();
    } catch (e){
      Get.log("get organisation details error => " + e.toString(), isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }
}
