import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/specialty_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';


class GetSpecialty extends Usecase<SpecialtyModel, SpecialtyParams> {
  final LoginRepo repo;

  GetSpecialty({required this.repo});

  @override
  Future<Either<Failure, SpecialtyModel>> call(SpecialtyParams params) {
    return repo.specialty(params.sectorName);
  }
}

class SpecialtyParams extends Params {
  final String sectorName;

  SpecialtyParams({required this.sectorName,});

  @override
  List<Object?> get props => [sectorName];
}
