import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/domain/repository/offers_repo.dart';

class GetOffersCat extends Usecase<Map<String, dynamic>, GetOffersParams> {
  final OffersRepo repo;

  GetOffersCat({required this.repo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(GetOffersParams params) {
    return repo.offers(params.offset);
  }
}

class GetOffersParams extends Equatable {
  int offset;

  GetOffersParams({required this.offset});

  @override
  List<Object?> get props => [offset];
}
