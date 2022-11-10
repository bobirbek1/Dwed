import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/data/model/offers/offer_gallery.dart';
import 'package:flutter_template/src/data/model/offers/offer_model.dart';
import 'package:flutter_template/src/data/model/offers/offers_cat_model.dart';
import 'package:get/get.dart';

abstract class OffersRemoteDatasource {
  Future<Map<String, dynamic>> fetchOffersCat(int offset);

  Future<Map<String, dynamic>> fetchOffersSubCat(int id, int offset);

  Future<Map<String, dynamic>> fetchOffers(int id, int offset);
  Future<List<OfferGallery>> fetchOfferGallery(int id,);
}

class OffersRemoteDatasourceImpl extends OffersRemoteDatasource {
  final Dio client;

  OffersRemoteDatasourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> fetchOffersCat(int offset) async {
    Map<String, String> qParams = {'offset': '$offset', 'limit': '10'};
    try {
      final result = await client.get("v1.0/api/cats/offers_cats/get_subs/0/",
          queryParameters: qParams);
      final data = result.data;
      Get.log("Offers result ==> $data");
      if (data != null) {
        final list = data["results"].map<OffersCatModel>((e) {
          return OffersCatModel.fromJson(e);
        }).toList();
        return {'results': list, 'next': data['next']};
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
  Future<Map<String, dynamic>> fetchOffersSubCat(int id, int offset) async {
    Map<String, String> qParams = {'offset': '$offset', 'limit': '10'};

    try {
      final result = await client.get("v1.0/api/cats/offers_cats/get_subs/$id/",
          queryParameters: qParams);
      final data = result.data;
      if (data != null) {
        Get.log("OffersChild result  ==> $data");
        final list = data["results"].map<OffersCatModel>((e) {
          return OffersCatModel.fromJson(e);
        }).toList();
        return {'results': list, 'next': data['next']};
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
  Future<Map<String, dynamic>> fetchOffers(int id, int offset) async {
    Map<String, String> qParams = {
      'limit': '20',
      'offer_cat': '$id',
      'offset': '$offset'
    };

    try {
      final result =
          await client.get("v1.0/api/offerings/", queryParameters: qParams);
      final data = result.data;
      if (data != null) {
        Get.log("OffersDetails result ==> $data");
        final list = data["results"].map<OfferModel>((e) {
          return OfferModel.fromJson(e);
        }).toList();
        return {'results': list, 'next': data['next']};
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
  Future<List<OfferGallery>> fetchOfferGallery(int id) async {
    try {
      final result =
          await client.get("v1.0/api/offerings/$id/gallery");
      final data = result.data;
      if (data != null) {
        Get.log("OfferGallery result ==> $data");
        final list = data.map<OfferGallery>((e) {
          return OfferGallery.fromJson(e);
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
}
