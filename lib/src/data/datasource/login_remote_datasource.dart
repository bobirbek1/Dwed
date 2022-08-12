import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/model/token_model.dart';

abstract class LoginRemoteDatasource {
  Future<TokenModel> login(String username, String password);
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
}
