
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetOffers extends Usecase<List<OffersModel>, NoParams> {
  final LoginRepo repo;

  GetOffers({required this.repo});

  @override
  Future<Either<Failure, List<OffersModel>>> call(NoParams params) {
    return repo.offers();
  }
}
