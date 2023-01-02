import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/domain/repository/others/offers_repo.dart';

class GetOffersSubCat
    extends Usecase<Map<String, dynamic>, GetOffersChildParams> {
  final OffersRepo repo;

  GetOffersSubCat({required this.repo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      GetOffersChildParams params) {
    return repo.offersChild(params.id, params.offset);
  }
}

class GetOffersChildParams extends Params {
  final int id;
  final int offset;

  GetOffersChildParams({required this.id, required this.offset});

  @override
  List<Object?> get props => [id, offset];
}
