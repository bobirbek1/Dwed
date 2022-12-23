// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/domain/repository/others/organisations_repo.dart';

class GetOrganisation
    extends Usecase<Map<String, dynamic>, GetOrganisationParams> {
  final OrganisationsRepo repo;

  GetOrganisation({required this.repo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      GetOrganisationParams params) {
    return repo.organisation(params.offset);
  }
}

class GetOrganisationParams extends Equatable {
  int offset;
  GetOrganisationParams({required this.offset});

  @override
  List<Object?> get props => [offset];
}
