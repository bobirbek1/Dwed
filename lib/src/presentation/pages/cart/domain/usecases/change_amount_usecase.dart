import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/repositories/cart_repository.dart';

class ChangeAmountUseCase extends Usecase<bool, ChangeAmountParams> {
  final CartRepository cartRepository;
  ChangeAmountUseCase({required this.cartRepository});

  @override
  Future<Either<Failure, bool>> call(ChangeAmountParams params) {
    return cartRepository.changeAmount(params.offerID, params.offerID);
  }
}

class ChangeAmountParams extends Params {
  final int offerID;
  final int amount;
  ChangeAmountParams({
   required this.offerID,
   required this.amount
  });
  @override
  List<Object?> get props => [offerID, amount];
}