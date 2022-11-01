
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetOffers extends Usecase<List<OffersModel>, GetOffersParams> {
  final LoginRepo repo;

  GetOffers({required this.repo});

  @override
  Future<Either<Failure, List<OffersModel>>> call(GetOffersParams params) {
    return repo.offers(params.offset);
  }
}

class GetOffersParams extends Equatable {
  int offset;

  GetOffersParams({required this.offset});

  @override
  List<Object?> get props => [offset];
}
