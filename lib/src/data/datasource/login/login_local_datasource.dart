import 'dart:convert';

import 'package:flutter_template/app/app_constants.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/model/others/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/others/token_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDatasource {
  Future<TokenModel> getToken();

  Future setToken(TokenModel token);

  Future<CreateAccountModel> getUserData();

  Future setUserData(CreateAccountModel token);

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
    final jsonString = prefs.getString(keyUserData);
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
      keyUserData,
      json.encode(
        token.toJson(),
      ),
    );
  }

}
