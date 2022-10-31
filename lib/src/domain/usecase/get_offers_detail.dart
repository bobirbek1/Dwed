import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers_details_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetOffersDetails extends Usecase<List<OffersDetailsModel>, GetOffersDetailsParams> {
  final LoginRepo repo;

  GetOffersDetails({required this.repo});

  @override
  Future<Either<Failure, List<OffersDetailsModel>>> call(GetOffersDetailsParams params) {
    return repo.offersDetails(params.id);
  }
}

class GetOffersDetailsParams extends Params {
  final int id;

  GetOffersDetailsParams({required this.id,});

  @override
  List<Object?> get props => [id];
}