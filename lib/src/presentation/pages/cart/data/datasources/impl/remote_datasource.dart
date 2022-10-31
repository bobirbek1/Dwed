import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/models/specialist_item.dart';
import 'package:get/instance_manager.dart';

import '../../models/orders_card_model.dart';
import '../abstracts/remote_datasource.dart';

class CardRemoteDataSourceImpl extends CardRemoteDataSource {
  final Dio client;

  CardRemoteDataSourceImpl({required this.client});

  @override
  Future<List<OrdersCardModel>> getCards() async {
    try {
      final res = await client.get('/v1.0/api/orders/cart/');
      final response = res.data;
      Get.log("getCards data => $response");
      if (response != null) {
        return response.map<OrdersCardModel>((e) {
          return OrdersCardModel.fromJson(e);
        }).toList();
      }
      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is DioError) {
        rethrow;
      } else {
        throw ServerUnknownException();
      }
    }
  }

  @override
  Future<List<SpecialistItemModel>> getItems(
      String org_slug_name, int responsible) async {
    try {
      final res = await client.get(
          '/v1.0/api/orders/ocart/$org_slug_name/?limit=20&offset=0&responsible=$responsible');
      final response = res.data;
      final data = response['results'];
      Get.log("getItems data => $data");
      if (data != null) {
        return data.map<SpecialistItemModel>((e) {
          return SpecialistItemModel.fromJson(e);
        }).toList();
      }

      throw ServerUnknownException();
    } catch (e) {
      Get.log(e.toString(), isError: true);
      if (e is DioError) {
        rethrow;
      } else {
        throw ServerUnknownException();
      }
    }
  }

  @override
  Future<bool> changeAmount(int offerId, int amount) async {
    try {
      FormData formData = FormData.fromMap({'qty' : amount});
      final res = await client.put('/v1.0/api/orders/cart/$offerId/', data: formData);
      final response = res.data;
      if (response != null) {
        return true;
      }
      throw ServerUnknownException();
    } catch (e) {
      if (e is DioError) {
        rethrow;
      } else {
        throw ServerUnknownException();
      }
    }
  }

  @override
  Future<bool> delete(int offerID, int amount) async {
    try {
      final res = await client.delete('/v1.0/api/orders/cart/$offerID/');
      final response = res.data;
      if(response != null) {
        return true;
      }
      throw ServerUnknownException();
    }catch (e) {
      if(e is DioError) {
        rethrow;
      }else {
        throw ServerUnknownException();
      }
    }
  }
}
