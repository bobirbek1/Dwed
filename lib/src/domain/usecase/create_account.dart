import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/create_account_token_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class CreateAccount extends Usecase<CreateAccountModel, CreateAccountParams> {
  final LoginRepo repo;

  CreateAccount({required this.repo});

  @override
  Future<Either<Failure, CreateAccountModel>> call(CreateAccountParams params) {
    return repo.createAccount(params.username, params.name,
        params.surname, params.phone, params.password);
  }
}

class CreateAccountParams extends Params {
  final String username;
  final String name;
  final String? surname;
  final String phone;
  final String password;
  final String birthday;
  final String gender;
  final String specialty;
  final String liveAddress;

  CreateAccountParams(
      {this.surname,
      required this.birthday,
      required this.gender,
      required this.specialty,
      required this.liveAddress,
      required this.name,
      required this.phone,
      required this.username,
      required this.password});

  @override
  List<Object?> get props => [
        surname,
        birthday,
        gender,
        specialty,
        liveAddress,
        name,
        phone,
        username,
        password,
      ];
}
