import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/model/stream/message_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_details_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_model.dart';
import 'package:get/get.dart';

abstract class StreamRemoteDatasource {
  Future<List<StreamModel>> fetchStreamList(int offset);
  Future<StreamDetailsModel> fetchStreamDetails(String orgSlugName);
  Future<List<MessageModel>> fetchChatMessages(String slugName);
  Future<bool> sendMessage(String text, String slugName);
}

class StreamRemoteDatasourceImpl extends StreamRemoteDatasource {
  final Dio client;

  StreamRemoteDatasourceImpl({required this.client});

  @override
  Future<List<StreamModel>> fetchStreamList(int offset) async {
    try {
      final result =
          await client.get("v1.0/api/streaming/?limit=20&offset=$offset");
      final data = result.data;
      if (data != null) {
        Get.log("StreamList result ==> $data");
        final list = data["results"].map<StreamModel>((e) {
          final stream = StreamModel.fromJson(e);
          stream.next = data["next"];
          return StreamModel.fromJson(e);
        }).toList();
        return list;
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<StreamDetailsModel> fetchStreamDetails(String orgSlugName) async {
    try {
      final result = await client.get("v1.0/api/streaming/$orgSlugName/");
      final data = result.data;
      if (data != null) {
        Get.log("StreamDetails result ==> $data");
        return StreamDetailsModel.fromJson(data);
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<List<MessageModel>> fetchChatMessages(String slugName) async {
    try {
      final result = await client.get("v1.0/api/streaming/$slugName/chat/");
      final data = result.data;
      if (data != null) {
        Get.log("chatMessages result ==> $data");
        return data["results"].map<MessageModel>((e) {
          return MessageModel.fromJson(e);
        }).toList();
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

  @override
  Future<bool> sendMessage(String text, String slugName) async {
    try {
      final sendData = {"text": text};
      final result = await client.post("v1.0/api/streaming/$slugName/chat/",
          data: sendData);
      final data = result.data;
      if (data != null) {
        Get.log("sendMessage result ==> $data");
        return true;
      }
      return false;
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }
}
