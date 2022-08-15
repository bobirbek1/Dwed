import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/specialty_model.dart';
import 'package:flutter_template/src/data/model/specialty_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';


class GetSpecialty extends Usecase<SpecialtyModel, SpecialtyParams> {
  final LoginRepo repo;

  GetSpecialty({required this.repo});

  @override
  Future<Either<Failure, SpecialtyModel>> call(SpecialtyParams params) {
    return repo.specialty(params.specilatyName);
  }
}

class SpecialtyParams extends Params {
  final String specilatyName;

  SpecialtyParams({required this.specilatyName,});

  @override
  List<Object?> get props => [specilatyName];
}
