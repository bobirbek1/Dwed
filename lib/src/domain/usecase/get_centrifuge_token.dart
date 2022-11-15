import 'package:flutter_template/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/domain/repository/stream_repo.dart';

class GetCentrifugeToken extends Usecase<String, NoParams> {
  final StreamRepo repo;

  GetCentrifugeToken({required this.repo});

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return repo.getCentrifugeToken();
  }
}
