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
    return repo.login(params.username, params.password, params.rememberMe);
  }
  Future<Either<Failure, bool>> resetCall(ResetParams params) {
    return repo.reset(params.newPassword, params.confirmPassword,);
  }
  // Future<Either<Failure, bool>> sendCall(PhoneSendReset params) {
  //   return repo.sendSms(params.phoneNumber,);
  // }
  // Future<Either<Failure, bool>> smsCode(VerifySmsCode params) {
  //   return repo.sendSms(params.smsCode,);
  // }
}

class PhoneSendReset extends Params{
  final String phoneNumber;

  PhoneSendReset({
    required this.phoneNumber,
  });
  @override
  List<Object?> get props => [phoneNumber];

}

class VerifySmsCode extends Params{
  final String smsCode;

  VerifySmsCode({
    required this.smsCode,
  });
  @override
  List<Object?> get props => [smsCode];

}


class ResetParams extends Params {
  final String newPassword;
  final String confirmPassword;

  ResetParams({
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [newPassword, confirmPassword];
}

class LoginParams extends Params {
  final String username;
  final String password;
  final bool rememberMe;

  LoginParams({
    required this.username,
    required this.password,
    required this.rememberMe,
  });

  @override
  List<Object?> get props => [username, password];
}
