import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/country_model.dart';
import 'package:flutter_template/src/data/model/region_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetCountry extends Usecase<CountryModel, CountryParams> {
  final LoginRepo repo;

  GetCountry({required this.repo});

  @override
  Future<Either<Failure, CountryModel>> call(CountryParams params) {
    return repo.country(params.countryName);
  }
}

class CountryParams extends Params {
  final String countryName;

  CountryParams({required this.countryName,});

  @override
  List<Object?> get props => [countryName];
}