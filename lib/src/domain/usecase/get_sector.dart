import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/sector_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetSector extends Usecase<SectorModel, NoParams> {
  final LoginRepo repo;

  GetSector({required this.repo});

  @override
  Future<Either<Failure, SectorModel>> call(NoParams params) {
    return repo.sector();
  }
}
