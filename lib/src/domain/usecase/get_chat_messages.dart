import 'package:flutter_template/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/stream/message_model.dart';
import 'package:flutter_template/src/domain/repository/stream_repo.dart';

class GetChatMessages extends Usecase<List<MessageModel>, MessageParams> {
  final StreamRepo repo;

  GetChatMessages({required this.repo});

  @override
  Future<Either<Failure, List<MessageModel>>> call(MessageParams params) {
    return repo.getChatMessages(params.slugName,params.offset);
  }
}

class MessageParams extends Params {
  final String slugName;
  final int offset;

  MessageParams({required this.slugName,required this.offset});

  @override
  List<Object?> get props => [slugName];
}
