import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers_details_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetOffersDetails extends Usecase<Map<String , dynamic>, GetOffersDetailsParams> {
  final LoginRepo repo;

  GetOffersDetails({required this.repo});

  @override
  Future<Either<Failure, Map<String , dynamic>>> call(GetOffersDetailsParams params) {
    return repo.offersDetails(params.id, params.offset);
  }
}

class GetOffersDetailsParams extends Params {
  final int id;
  final int offset;

  GetOffersDetailsParams({required this.id,required this.offset});

  @override
  List<Object?> get props => [id, offset];
}