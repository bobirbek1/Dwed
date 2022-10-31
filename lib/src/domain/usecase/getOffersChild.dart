import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/offers_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetOffersChild extends Usecase<List<OffersModel>, GetOffersChildParams> {
  final LoginRepo repo;

  GetOffersChild({required this.repo});

  @override
  Future<Either<Failure, List<OffersModel>>> call(GetOffersChildParams params) {
    return repo.offersChild(params.id, params.offset);
  }
}

class GetOffersChildParams extends Params {
  final int id;
  final int offset;

  GetOffersChildParams({required this.id,required this.offset});

  @override
  List<Object?> get props => [id, offset];
}