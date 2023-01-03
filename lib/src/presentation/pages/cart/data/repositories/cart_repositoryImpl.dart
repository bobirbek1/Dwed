import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/exception_handler.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/platform/network_info.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/datasources/abstracts/local_datasource.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/datasources/abstracts/remote_datasource.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/repositories/cart_repository.dart';

import '../../../../../data/model/models/orders_card_model.dart';
import '../../../../../data/model/models/specialist_item.dart';

class CardRepositoryImpl extends CartRepository {
  CardRemoteDataSource cardRemoteDataSource;
  CardLocalDataSource cardLocalDataSource;
  NetworkInfo networkInfo;

  CardRepositoryImpl({
    required this.cardRemoteDataSource,
    required this.cardLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<OrdersCardModel>>> getCard() async {
    if (await networkInfo.isConnected) {
      try {
        final res = await cardRemoteDataSource.getCards();
        return Right(res);
      } catch (e) {
        var failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<SpecialistItemModel>>> getItems(
      String org_slug_name, int responsible) async {
    if (await networkInfo.isConnected) {
      try {
        final res =
            await cardRemoteDataSource.getItems(org_slug_name, responsible);
        return Right(res);
      } catch (e) {
        var failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> changeAmount(int id, int amount) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await cardRemoteDataSource.changeAmount(id, amount);
        if (res) {}
        return const Right(true);
      } catch (e) {
        var failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
