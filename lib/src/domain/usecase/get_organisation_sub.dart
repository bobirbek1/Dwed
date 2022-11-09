import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';
import 'package:flutter_template/src/domain/usecase/get_organisation.dart';

class GetOrganisationSub extends Usecase<Map<String, dynamic>, GetOrganisationSubParams> {
  final LoginRepo repo;

  GetOrganisationSub({required this.repo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(GetOrganisationSubParams params) {
    return repo.organisationSub(params.offset, params.category);
  }

}

class GetOrganisationSubParams extends Equatable {
  int offset;
  String category;

  GetOrganisationSubParams({required this.offset, required this.category});

  @override
  List<Object?> get props => [offset, category];

}