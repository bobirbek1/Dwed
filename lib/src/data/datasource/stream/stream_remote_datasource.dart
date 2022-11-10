import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/model/stream/stream_details_model.dart';
import 'package:flutter_template/src/data/model/stream/stream_model.dart';
import 'package:get/get.dart';

abstract class StreamRemoteDatasource {
  Future<List<StreamModel>> fetchStreamList(int offset);
  Future<StreamDetailsModel> fetchStreamDetails(String orgSlugName);
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
      final result =
          await client.get("v1.0/api/streaming/$orgSlugName/");
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
}
