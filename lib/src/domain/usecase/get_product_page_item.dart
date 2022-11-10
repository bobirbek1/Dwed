// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers/offer_details_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetProductPageItem
    extends Usecase<OfferDetailsModel, GetProductPageItemParams> {
  final LoginRepo repo;

  GetProductPageItem({required this.repo});

  @override
  Future<Either<Failure, OfferDetailsModel>> call(
      GetProductPageItemParams params) {
    return repo.getProductPageItem(params.type, params.id);
  }
}

class GetProductPageItemParams extends Equatable {
  String type;
  int id;
  GetProductPageItemParams({required this.type, required this.id});
  @override
  List<Object?> get props => [type, id];
}
