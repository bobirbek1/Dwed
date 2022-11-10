import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/exception_handler.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/platform/network_info.dart';
import 'package:flutter_template/src/data/datasource/organisations/organisations_remote_datasource.dart';
import 'package:flutter_template/src/data/model/organisation_details_model.dart';
import 'package:flutter_template/src/data/model/organisation_model.dart';
import 'package:flutter_template/src/domain/repository/organisations_repo.dart';
import 'package:get/get.dart';

class OrganisationsRepoImpl extends OrganisationsRepo {
  final OrganisationsRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  OrganisationsRepoImpl(
      {required this.remoteDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> organisation(int offset) async {
    if (await networkInfo.isConnected) {
      Get.log("get region is connected");
      try {
        final res = await remoteDatasource.organisation(offset);
        // Get.log("Organisation repo $res");
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        Get.log("get region failure $failure");
        return Left(failure);
      }
    } else {
      Get.log("get region disconnected");
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> organisationSub(
      int offset, String category) async {
    if (await networkInfo.isConnected) {
      Get.log("get region is connected");
      try {
        final res = await remoteDatasource.organisationSub(offset, category);
        Get.log("Organisation repo $res");
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        Get.log("get region failure $failure");
        return Left(failure);
      }
    } else {
      Get.log("get region disconnected");
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, OrganisationModel>> organisationUserPage(
      String slugName) async {
    if (await networkInfo.isConnected) {
      Get.log("get user post page item is connected");
      try {
        final res = await remoteDatasource.organisationUserPost(slugName);
        Get.log("organisation user post item => $res");
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        Get.log('repos organisation user post page => $e');
        return Left(failure);
      }
    } else {
      Get.log("get user post page item disconnected");
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrganisationDetailsModel>>> organisationDetails(
      String slugName, int offset) async {
    if (await networkInfo.isConnected) {
      Get.log("get organisation details model connected");
      try {
        final res =
            await remoteDatasource.organisationDetails(slugName, offset);
        return Right(res);
      } catch (e) {
        final failure = handleException(e as Exception);
        Get.log(
            "get organisation details item failure => ${failure.toString()}");
        return Left(failure);
      }
    } else {
      Get.log("get organisation item in repo disconnected");
      return const Left(NetworkFailure());
    }
  }
}
