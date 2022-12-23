import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/data/model/others/organisation_details_model.dart';
import 'package:flutter_template/src/data/model/others/organisation_model.dart';

abstract class OrganisationsRepo {
  Future<Either<Failure, Map<String, dynamic>>> organisation(int offset);
  Future<Either<Failure, Map<String, dynamic>>> organisationSub(
      int offset, String category);
  Future<Either<Failure, List<OrganisationDetailsModel>>> organisationDetails(
      String slugName, int offset);
  Future<Either<Failure, OrganisationModel>> organisationUserPage(
      String slugName);
}
