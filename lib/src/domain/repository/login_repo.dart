import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/token_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, TokenModel>> login(String username, String password);
}
