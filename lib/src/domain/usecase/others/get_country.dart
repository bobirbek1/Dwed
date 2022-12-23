import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/others/country_model.dart';
import 'package:flutter_template/src/domain/repository/others/login_repo.dart';

class GetCountry extends Usecase<CountryModel, NoParams> {
  final LoginRepo repo;

  GetCountry({required this.repo});

  @override
  Future<Either<Failure, CountryModel>> call(params) {
    return repo.country();
  }
}
