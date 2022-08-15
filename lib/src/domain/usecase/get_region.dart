






import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/region_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetRegion extends Usecase<RegionModel, RegionParams> {
  final LoginRepo repo;

  GetRegion({required this.repo});

  @override
  Future<Either<Failure, RegionModel>> call(RegionParams params) {
    return repo.region(params.countryId);
  }
}

class RegionParams extends Params {
  final int countryId;

  RegionParams({required this.countryId,});

  @override
  List<Object?> get props => [countryId];
}