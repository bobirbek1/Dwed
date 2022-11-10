import 'package:flutter_template/core/error/exception_handler.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/platform/network_info.dart';
import 'package:flutter_template/src/data/datasource/offers/offers_remote_datasource.dart';
import 'package:flutter_template/src/data/model/offers/offer_gallery.dart';
import 'package:flutter_template/src/domain/repository/offers_repo.dart';
import 'package:get/get.dart';

class OffersRepoImpl extends OffersRepo {
  final OffersRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  OffersRepoImpl({required this.remoteDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> offers(int offset) async {
    if (await networkInfo.isConnected) {
      Get.log("get offers is connected");
      try {
        final res = await remoteDatasource.fetchOffersCat(offset);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      Get.log("get offers disconnected");
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> offersChild(
      int id, int offset) async {
    if (await networkInfo.isConnected) {
      Get.log("get offersChild is connected");
      try {
        final res = await remoteDatasource.fetchOffersSubCat(id, offset);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      Get.log("get offersChild disconnected");
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> offersDetails(
      int id, int offset) async {
    if (await networkInfo.isConnected) {
      Get.log("get offersChild is connected");
      try {
        final res = await remoteDatasource.fetchOffers(id, offset);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      Get.log("get offersChild disconnected");
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<OfferGallery>>> offerGallery(int id) async {
      if (await networkInfo.isConnected) {
      Get.log("get offerGallery is connected");
      try {
        final res = await remoteDatasource.fetchOfferGallery(id);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        return Left(failure);
      }
    } else {
      Get.log("get offerGallery disconnected");
      return const Left(NetworkFailure());
    }
  }
}
