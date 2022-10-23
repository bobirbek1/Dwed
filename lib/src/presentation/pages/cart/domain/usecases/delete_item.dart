import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/repositories/cart_repository.dart';

class DeleteItemUseCase extends Usecase<bool , DeleteCartProductParams>{
  final CartRepository cartRepository;
  DeleteItemUseCase({ required this.cartRepository});
  @override
  Future<Either<Failure, bool>> call(DeleteCartProductParams params) async {
    return cartRepository.deleteItem(params.id);
  }
}

class DeleteCartProductParams extends Params{
  int id;
  DeleteCartProductParams({required this.id});
  @override
  List<Object?> get props => [id];
}