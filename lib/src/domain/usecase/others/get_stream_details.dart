import 'package:flutter_template/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/stream/stream_details_model.dart';
import 'package:flutter_template/src/domain/repository/others/stream_repo.dart';

class GetStreamDetails
    extends Usecase<StreamDetailsModel, StreamDetailsParams> {
  final StreamRepo repo;

  GetStreamDetails({required this.repo});

  @override
  Future<Either<Failure, StreamDetailsModel>> call(
      StreamDetailsParams params) {
    return repo.getStreamDetails(params.orgSlugName);
  }
}

class StreamDetailsParams extends Params {
  final String orgSlugName;
  StreamDetailsParams({required this.orgSlugName});
  @override
  List<Object?> get props => throw UnimplementedError();
}
