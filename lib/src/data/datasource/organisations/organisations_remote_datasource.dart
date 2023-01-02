

import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/model/others/organisation_details_model.dart';
import 'package:flutter_template/src/data/model/others/organisation_model.dart';
import 'package:get/get.dart';

abstract class OrganisationsRemoteDatasource {
  Future<Map<String, dynamic>> organisation(int offset);

  Future<Map<String, dynamic>> organisationSub(int offset, String category);

  Future<List<OrganisationDetailsModel>> organisationDetails(
      String slugName, int offset);

  Future<OrganisationModel> organisationUserPost(String slugName);
}

class OrganisationsRemoteDatasourceImpl extends OrganisationsRemoteDatasource {
  final Dio client;

  OrganisationsRemoteDatasourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> organisation(int offset) async {
    Map<String, String> qParams = {'offset': '$offset', 'limit': '10'};
    try {
      final result =
          await client.get("v1.0/api/orgs/", queryParameters: qParams);
      final data = result.data;
      Get.log("Organisation remotedata result$data");
      if (data != null) {
        final list = data["results"].map<OrganisationModel>((e) {
          Get.log("Organisation map => $e}");
          Get.log("Organisation map from =>${OrganisationModel.fromJson(e)}");
          return OrganisationModel.fromJson(e);
        }).toList();
        return {'results': list, 'next': data['next'] != null ? true : false};
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
  Future<Map<String, dynamic>> organisationSub(
      int offset, String category) async {
    Map<String, String> qParams = {
      'category': category,
      'offset': '$offset',
      'limit': '10'
    };
    try {
      final result =
          await client.get("v1.0/api/orgs/", queryParameters: qParams);
      final data = result.data;
      Get.log("Organisation remotedata result$data");
      if (data != null) {
        final list = data["results"].map<OrganisationModel>((e) {
          Get.log("Organisation map => $e}");
          Get.log("Organisation map from =>${OrganisationModel.fromJson(e)}");
          return OrganisationModel.fromJson(e);
        }).toList();
        return {'results': list, 'next': data['next'] != null ? true : false};
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
  Future<OrganisationModel> organisationUserPost(String slugName) async {
    try {
      final result = await client.get('/v1.0/api/orgs/$slugName/');
      final data = result.data;
      Get.log("user post page item = > $data");
      if (data != null) {
        return data;
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }

   @override
  Future<List<OrganisationDetailsModel>> organisationDetails(
      String slugName, int offset) async {
    Get.log('organisation details called');
    try {
      final result = await client
          .get('/v1.0/api/orgs/$slugName/offerings/?limit=15&offset=$offset');
      Get.log('organisation details result => ${result}');
      final data = result.data;
      if (data != null) {
        Get.log('organisation details result data => ${result}');
        final res = data['results'].map<OrganisationDetailsModel>((e) {
          Get.log("organisation model list item  => $e");
          Get.log(
              "organisation model list item from json => ${OrganisationDetailsModel.fromJson(e)}");
          return OrganisationDetailsModel.fromJson(e);
        }).toList();
        return res;
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log("get organisation details error => " + e.toString(),
          isError: true);
      if (e is! DioError) {
        throw ServerUnknownException();
      }
      rethrow;
    }
  }
}
