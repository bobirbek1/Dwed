
import 'package:flutter_template/src/presentation/pages/cart/data/models/specialist_item.dart';

import '../../models/orders_card_model.dart';

abstract class CardRemoteDataSource {
  Future<List<OrdersCardModel>> getCards();

  Future<List<SpecialistItemModel>> getItems(String org_slug_name, int responsible);

  Future<bool> changeAmount(int id, int amount);

  Future<bool> delete(int offerID, int amount);
}
