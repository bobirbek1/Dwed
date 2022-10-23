

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/models/specialist_item.dart';

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
        if(response != null) {
        return response.map((e) {
          return OrdersCardModel.fromJson(e);
        }).toList();
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
  Future<List<SpecialistItemModel>> getItems(
      String org_slug_name, int responsible) async {
    try {
      final res = await client.get(
          '/v1.0/api/orders/ocart/{$org_slug_name}/?limit=20&offset=0&responsible={$responsible}');
      final response = res.data;
      final data = response['results'];
      if(data != null) {
        return data.map<SpecialistItemModel>((e) {
          return SpecialistItemModel.fromJson(e);
        }).toList();
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
  Future<bool> changeAmount(int id, int amount)  async {
    try {
      final res = await client.put(' ');
      if(res != null) {
        return true;
      }
      throw ServerUnknownException();
    }catch (e) {
      if (e is DioError) {
        rethrow;
      } else {
        throw ServerUnknownException();
      }
    }
  }
}
