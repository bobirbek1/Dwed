import 'package:flutter_template/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/token_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class Login extends Usecase<TokenModel, LoginParams> {
  final LoginRepo repo;

  Login({required this.repo});

  @override
  Future<Either<Failure, TokenModel>> call(LoginParams params) {
    return repo.login(params.username, params.password);
  }
}

class LoginParams extends Params {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
