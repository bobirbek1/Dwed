import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/models/orders_card_model.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/models/specialist_item.dart';

abstract class CartRepository {

  Future<Either<Failure, List<OrdersCardModel>>> getCard();

  Future<Either<Failure, List<SpecialistItemModel>>> getItems(String org_slug_name, int responsible);

  Future<Either<Failure , bool>> deleteItem(int id);
}