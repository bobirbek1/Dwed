import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/organisation_model.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';

class GetOrganisation extends Usecase<Map<String, dynamic>, GetOrganisationParams> {
  final LoginRepo repo;

  GetOrganisation({required this.repo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(GetOrganisationParams params) {
    return repo.organisation(params.offset);
  }
}

class GetOrganisationParams extends Equatable{
  int offset;
  GetOrganisationParams({required this.offset});


  @override
  List<Object?> get props => [offset];}

