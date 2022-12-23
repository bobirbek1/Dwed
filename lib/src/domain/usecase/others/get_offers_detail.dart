import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/domain/repository/others/offers_repo.dart';

class GetOffers extends Usecase<Map<String, dynamic>, GetOffersDetailsParams> {
  final OffersRepo repo;

  GetOffers({required this.repo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      GetOffersDetailsParams params) {
    return repo.offersDetails(params.id, params.offset);
  }
}

class GetOffersDetailsParams extends Params {
  final int id;
  final int offset;

  GetOffersDetailsParams({required this.id, required this.offset});

  @override
  List<Object?> get props => [id, offset];
}
