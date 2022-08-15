






import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/create_account_token_model.dart';
import 'package:flutter_template/src/data/model/region_model.dart';
import 'package:flutter_template/src/data/model/region_model.dart';
import 'package:flutter_template/src/data/model/token_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetRegion extends Usecase<RegionModel, RegionParams> {
  final LoginRepo repo;

  GetRegion({required this.repo});

  @override
  Future<Either<Failure, RegionModel>> call(RegionParams params) {
    return repo.region(params.regionName);
  }
}

class RegionParams extends Params {
  final String regionName;

  RegionParams({required this.regionName,});

  @override
  List<Object?> get props => [regionName];
}