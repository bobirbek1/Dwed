import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/data/model/details_model_for_products_page.dart';
import 'package:flutter_template/src/domain/repository/login_repo.dart';
import 'package:flutter_template/src/domain/usecase/get_organisation_user_post.dart';

class GetProductPageItem extends Usecase<DetailsModelForProductsPage, GetProductPageItemParams>{
  final LoginRepo repo;

  GetProductPageItem({required this.repo});

  @override
  Future<Either<Failure, DetailsModelForProductsPage>> call(GetProductPageItemParams params) {
    throw repo.getProductPageItem(params.type, params.id);
  }

}

class GetProductPageItemParams extends Equatable{
  String type;
  int id;
  GetProductPageItemParams({required this.type, required this.id});
  @override
  List<Object?> get props => [type, id];
}