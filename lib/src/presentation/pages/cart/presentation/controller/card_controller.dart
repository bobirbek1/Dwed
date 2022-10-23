import 'package:dartz/dartz.dart';
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
  Map<int ,List< SpecialistItemModel>> cardProductsMap = <int , List< SpecialistItemModel>>{};
  List<OrdersCardModel> orderList = [];


  @override
  void onInit() {
    super.onInit();
    getCardItems();
  }

  changeAmount (int id, int amount) async {
    final res = await deleteItemUseCase.call(DeleteCartProductParams(id: id, amount: amount));
    res.fold((failure) => {

    }, (response) => {
      if(response){
        orders[id] = amount,
        calculateCost()
      } else {

      }
    });
  }

  deleteFromList(int id, int offeringId) {
    cardProductsMap.remove(id);
    calculateCost();
  }

  getTotal(int id) {
    return orders[id] ?? 0;
  }

  getItems (String org_slug_name, int responsible) async {
    if(cardProductsMap.containsKey(responsible)) {
      return cardProductsMap[responsible];
    }else {

      final res = await getItemsUseCase.call(
          GetItemsUseCaseParams(org_slug_name: org_slug_name, responsible: responsible)
      );
      res.fold((failure){
        if(failure is NetworkFailure) {
          return [];
        }
      }, (response) {
        cardProductsMap[responsible] = response;
        return response;
      });
    }
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
        totalCost += product.totalCost! * orders[product.responsible!.id]!;
      }
    }
    update([checkoutId]);
  }
}