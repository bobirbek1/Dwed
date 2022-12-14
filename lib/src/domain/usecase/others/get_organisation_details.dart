import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/others/organisation_details_model.dart';
import 'package:flutter_template/src/domain/repository/others/organisations_repo.dart';

class GetOrganisationDetails
    extends Usecase<List<OrganisationDetailsModel>,
        GetOrganisationDetailsParams> {
  final OrganisationsRepo loginRepo;

  GetOrganisationDetails({
    required this.loginRepo
  });

  @override
  Future<Either<Failure, List<OrganisationDetailsModel>>> call(
      GetOrganisationDetailsParams params) {
    return loginRepo.organisationDetails(params.slugName, params.offSet);
  }
}

class GetOrganisationDetailsParams {
  String slugName;
  int offSet;

  GetOrganisationDetailsParams({
    required this.slugName,
    required this.offSet,
  });
}