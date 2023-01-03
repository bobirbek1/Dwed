import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/repositories/cart_repository.dart';

import '../../../../../data/model/models/orders_card_model.dart';

class GetCardProductsImpl extends Usecase<List<OrdersCardModel>, NoParams> {
  CartRepository cartRepository;

  GetCardProductsImpl({
    required this.cartRepository
  });

  @override
  Future<Either<Failure, List<OrdersCardModel>>> call(NoParams params) async {
    return cartRepository.getCard();
  }
}