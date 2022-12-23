import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/stream/message_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_details_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_model.dart';

abstract class StreamRepo {
  Future<Either<Failure, List<StreamModel>>> getStreamList(int offset);
  Future<Either<Failure, StreamDetailsModel>> getStreamDetails(
      String orgSlugName);
  Future<Either<Failure, List<MessageModel>>> getChatMessages(
      String slugName, int offset);
  Future<Either<Failure, bool>> sendMessage(String text, String slugName);
  Future<Either<Failure, String>> getCentrifugeToken();
}
