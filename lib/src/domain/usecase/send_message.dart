import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/domain/repository/stream_repo.dart';

class SendMessage extends Usecase<bool, SendMessageParams> {
  final StreamRepo repo;

  SendMessage({required this.repo});

  @override
  Future<Either<Failure, bool>> call(SendMessageParams params) {
    return repo.sendMessage(params.text, params.slugName);
  }
}

class SendMessageParams extends Params {
  // final String username;
  final String text;
  final String slugName;

  SendMessageParams(
      {required this.slugName, required this.text, });

  @override
  List<Object?> get props => [ text, slugName];
}
