import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/organisation_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetOrganisation extends Usecase<List<OrganisationModel>, NoParams> {
  final LoginRepo repo;

  GetOrganisation({required this.repo});

  @override
  Future<Either<Failure, List<OrganisationModel>>> call(NoParams params) {
    return repo.organisation();
  }
}

