


import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/repositories/cart_repository.dart';

import '../../../../../data/model/models/specialist_item.dart';

class GetItemsUseCase extends Usecase<List<SpecialistItemModel>, GetItemsUseCaseParams>{
  final CartRepository cartRepository;

  GetItemsUseCase({
    required this.cartRepository
  });

  @override
  Future<Either<Failure, List<SpecialistItemModel>>> call(GetItemsUseCaseParams params) async {
    return cartRepository.getItems(params.org_slug_name , params.responsible);
  }

}

class GetItemsUseCaseParams extends Params{
  String org_slug_name;
  int responsible;

  GetItemsUseCaseParams({
    required this.org_slug_name,
    required this.responsible,
  });

  @override
  List<Object?> get props => [org_slug_name, responsible];
}