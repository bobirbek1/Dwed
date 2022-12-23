import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/others/organisation_model.dart';
import 'package:flutter_template/src/domain/repository/others/organisations_repo.dart';

class GetOrganisationUserPost extends Usecase<OrganisationModel , GetOrganisationUserPostParams> {
  OrganisationsRepo repo;
  GetOrganisationUserPost({required this.repo});

  @override
  Future<Either<Failure, OrganisationModel>> call(GetOrganisationUserPostParams params) async {
    return await repo.organisationUserPage(params.slugName);
  }
}

class GetOrganisationUserPostParams extends Equatable {
  String slugName;
  GetOrganisationUserPostParams({required this.slugName});
  @override
  List<Object?> get props => [slugName];
}