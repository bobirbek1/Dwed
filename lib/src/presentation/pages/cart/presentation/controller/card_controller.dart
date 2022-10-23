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
  // usecases
  final GetCardProductsImpl getCardProducts;
  final GetItemsUseCase getItemsUseCase;
  final DeleteItemUseCase deleteItemUseCase;

  CardController({
    required this.getCardProducts,
    required this.getItemsUseCase,
    required this.deleteItemUseCase,
  });

  // get builder's ids
  final checkoutId = 'Checkout_id';
  final cardsId = 'cards_id';
  final offersId = 'offers_id';

  // states
  var cardsState = CardState.initial;
  var offersState = CardState.initial;

  // total product cost
  int totalCost = 0;

  // data
  Map<int, int> orders = {};
  List<SpecialistItemModel> cardProducts = [];
  Map<int, List<SpecialistItemModel>> cardProductsMap =
      <int, List<SpecialistItemModel>>{};
  List<OrdersCardModel> orderList = [];

  @override
  void onInit() {
    super.onInit();
    getCardItems();
  }

  changeAmount(int id, int amount) async {
    final res = await deleteItemUseCase
        .call(DeleteCartProductParams(id: id, amount: amount));
    res.fold(
        (failure) => {},
        (response) => {
              if (response) {orders[id] = amount, calculateCost()} else {}
            });
  }

  deleteFromList(int id, int offeringId) {
    cardProductsMap.remove(id);
    calculateCost();
  }

  getTotal(int id) {
    return orders[id] ?? 0;
  }

  getItems(String orgSlugName, int responsible) async {
    updateOffersState(CardState.loading);
    if (cardProductsMap.containsKey(responsible)) {
      updateOffersState(CardState.loaded);
      return cardProductsMap[responsible];
    } else {
      final res = await getItemsUseCase.call(GetItemsUseCaseParams(
          org_slug_name: orgSlugName, responsible: responsible));
      res.fold((failure) {
        Get.log("failure: $failure");
        if (failure is NetworkFailure) {}
        updateOffersState(CardState.error);
      }, (response) {
        cardProductsMap[responsible] = response;
        response;
        updateOffersState(CardState.loaded);
      });
    }
  }

  void getCardItems() async {
    updateCardsState(CardState.loading);
    final res = await getCardProducts.call(NoParams());
    res.fold((failure) {
      Get.log("failure: $failure");
      if (failure is NetworkFailure) {}
      updateCardsState(CardState.error);
    }, (response) {
      orderList = response;
      for (var element in orderList) {
        if (element.seller?.specialists != null) {
          for (var specialist in element.seller!.specialists!) {
            getItems(element.seller?.slugName ?? "jd_poliklinika",
                specialist.id ?? 0);
          }
        }
      }
      updateCardsState(CardState.loaded);
    });
  }

  void calculateCost() {
    totalCost = 0;
    for (var product in cardProducts) {
      if (orders.containsKey(product.responsible!.id)) {
        totalCost += product.totalCost! * orders[product.responsible!.id]!;
      }
    }
    update([checkoutId]);
  }

  void updateCardsState(CardState state) {
    cardsState = state;
    update([cardsId]);
  }

  void updateOffersState(CardState state) {
    offersState = state;
    update([offersId]);
  }
}

enum CardState { initial, loading, error, loaded }
