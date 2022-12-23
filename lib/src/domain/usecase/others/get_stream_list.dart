import 'package:flutter_template/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/stream/stream_model.dart';
import 'package:flutter_template/src/domain/repository/others/stream_repo.dart';

class GetStreamList extends Usecase<List<StreamModel>, StreamListParams> {
  final StreamRepo repo;

  GetStreamList({required this.repo});

  @override
  Future<Either<Failure, List<StreamModel>>> call(StreamListParams params) {
    return repo.getStreamList(params.offset);
  }
}

class StreamListParams extends Params {
  final int offset;

  StreamListParams({required this.offset});

  @override
  List<Object?> get props => [offset];
}
