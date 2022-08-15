import 'dart:convert';

import 'package:flutter_template/app/app_constants.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/model/country_model.dart';
import 'package:flutter_template/src/data/model/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/region_model.dart';
import 'package:flutter_template/src/data/model/sector_model.dart';
import 'package:flutter_template/src/data/model/specialty_model.dart';
import 'package:flutter_template/src/data/model/token_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDatasource {
  Future<TokenModel> getToken();

  Future setToken(TokenModel token);

  Future<CreateAccountModel> getUserData();

  Future setUserData(CreateAccountModel token);

  Future setRegionDate(RegionModel regionModel);
  Future setCountryDate(CountryModel countryModel);
  Future setSectorDate(SectorModel sectorModel);
  Future setSpecialtyDate(SpecialtyModel specialtyModel);
}

class LoginLocalDatasourceImpl extends LoginLocalDatasource {
  final SharedPreferences prefs;

  LoginLocalDatasourceImpl({required this.prefs});

  @override
  Future<TokenModel> getToken() async {
    final jsonString = prefs.getString(keyToken);
    Get.log("token json string is $jsonString");
    if (jsonString != null) {
      return TokenModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future setToken(TokenModel token) async {
    return await prefs.setString(
      keyToken,
      json.encode(
        token.toJson(),
      ),
    );
  }

  @override
  Future<CreateAccountModel> getUserData() async {
    final jsonString = prefs.getString(keyCreateAccountToken);
    Get.log("token json string is $jsonString");
    if (jsonString != null) {
      return CreateAccountModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future setUserData(CreateAccountModel token) async {
    return await prefs.setString(
      keyToken,
      json.encode(
        token.toJson(),
      ),
    );
  }

  @override
  Future setRegionDate(RegionModel regionModel) async {
    return await prefs.setString(
      keyToken,
      json.encode(
        regionModel.toJson(),
      ),
    );
  }

  @override
  Future setCountryDate(CountryModel countryModel) async {
    return await prefs.setString(
      keyToken,
      json.encode(
        countryModel.toJson(),
      ),
    );
  }

  @override
  Future setSectorDate(SectorModel sectorModel) async {
    return await prefs.setString(
      keyToken,
      json.encode(
        sectorModel.toJson(),
      ),
    );
  }

  @override
  Future setSpecialtyDate(SpecialtyModel specialtyModel) async {
    return await prefs.setString(
      keyToken,
      json.encode(
        specialtyModel.toJson(),
      ),
    );
  }
}
