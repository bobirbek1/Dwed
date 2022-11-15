import 'package:flutter_template/core/error/exception_handler.dart';
import 'package:flutter_template/core/platform/network_info.dart';
import 'package:flutter_template/src/data/datasource/stream/stream_remote_datasource.dart';
import 'package:flutter_template/src/data/model/stream/message_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_details_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_model.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/src/domain/repository/stream_repo.dart';
import 'package:get/get.dart';

class StreamRepoImpl extends StreamRepo {
  final StreamRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  StreamRepoImpl({required this.remoteDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, List<StreamModel>>> getStreamList(int offset) async {
    if (await networkInfo.isConnected) {
      Get.log("get streamList is connected");
      try {
        final res = await remoteDatasource.fetchStreamList(offset);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      Get.log("get streamList disconnected");
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, StreamDetailsModel>> getStreamDetails(
      String orgSlugName) async {
     if (await networkInfo.isConnected) {
      Get.log("get streamDetails is connected");
      try {
        final res = await remoteDatasource.fetchStreamDetails(orgSlugName);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      Get.log("get streamDetails disconnected");
      return const Left(NetworkFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<MessageModel>>> getChatMessages(String slugName,int offset) async {
      if (await networkInfo.isConnected) {
      Get.log("get getChatMessages is connected");
      try {
        final res = await remoteDatasource.fetchChatMessages(slugName,offset);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      Get.log("get getChatMessages disconnected");
      return const Left(NetworkFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> sendMessage( String text, String slugName) async {
      if (await networkInfo.isConnected) {
      Get.log("get sendMessage is connected");
      try {
        final res = await remoteDatasource.sendMessage(text,slugName);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      Get.log("get sendMessage disconnected");
      return const Left(NetworkFailure());
    }
  }
  
  @override
  Future<Either<Failure, String>> getCentrifugeToken() async {
     if (await networkInfo.isConnected) {
      Get.log("get sendMessage is connected");
      try {
        final res = await remoteDatasource.fetchCentrifugeToken();
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      Get.log("get sendMessage disconnected");
      return const Left(NetworkFailure());
    }
  }
}
