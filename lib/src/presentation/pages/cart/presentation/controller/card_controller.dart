import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/models/orders_card_model.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/models/specialist_item.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/delete_item.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/get_card_products_impl.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/getitems_usecase.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  final GetCardProductsImpl getCardProducts;
  final GetItemsUseCase getItemsUseCase;
  final DeleteItemUseCase deleteItemUseCase;

  CardController({
    required this.getCardProducts,
    required this.getItemsUseCase,
    required this.deleteItemUseCase,
  });

  final checkoutId = 'Checkout_id';
  final mainListId = 'main_list_id';


  int totalCost = 0;
  Map<int, int> orders = {};
  List<SpecialistItemModel> cardProducts = [];
  List<OrdersCardModel> orderList = [];


  @override
  void onInit() {
    super.onInit();
    getCardItems();
  }

  deleteOrder (int id) async {
    final res = await deleteItemUseCase.call(DeleteCartProductParams(id: id));
    res.fold((failure) => {

    }, (response) => {
      if(response){
        orders.remove(id),
        calculateCost()
      } else {

      }
    });
  }

  getTotal(int id) {
    return orders[id] ?? 0;
  }

  addOrder(int id, int count) {
    if(orders.containsKey(id)) {
      orders[id] = orders[id]! + 1;
    }else {
      orders[id] = 1;
      calculateCost();
    }
    return getTotal(id);
  }

  removeOrder(int id, int count) {
    if(orders.containsKey(id)) {
      if(orders[id]! > 1) {
        orders[id] = orders[id]! - 1;
      }else {
        orders.remove(id);
        calculateCost();
      }
    }
    return getTotal(id);
  }

  getItems (String org_slug_name, int responsible) async {
    final res = await getItemsUseCase.call(
      GetItemsUseCaseParams(org_slug_name: org_slug_name, responsible: responsible)
    );
    res.fold((failure){
      if(failure is NetworkFailure) {
        return [];
      }
    }, (response) {
      cardProducts = response;
      return response;
    });
  }

  void getCardItems() async {
    final res = await getCardProducts.call(NoParams());
    res.fold((failure) {
      if(failure is NetworkFailure) {

      }
    }, (response)  {
      orderList = response;
      update([mainListId]);
    });
  }

  void calculateCost () {
    totalCost = 0;
    for(var product in cardProducts) {
      if(orders.containsKey(product.responsible!.id)) {
        totalCost += product.totalCost!;
      }
    }
    update([checkoutId]);
  }
}