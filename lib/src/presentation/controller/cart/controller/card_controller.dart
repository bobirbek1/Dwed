

import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/change_amount_usecase.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/delete_item.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/get_card_products_impl.dart';
import 'package:flutter_template/src/presentation/pages/cart/domain/usecases/getitems_usecase.dart';
import 'package:get/get.dart';

import '../../../../data/model/models/orders_card_model.dart';
import '../../../../data/model/models/specialist_item.dart';

class CardController extends GetxController {
  // usecases
  final GetCardProductsImpl getCardProducts;
  final GetItemsUseCase getItemsUseCase;
  final DeleteItemUseCase deleteItemUseCase;
  final ChangeAmountUseCase changeAmountUseCase;

  CardController({
    required this.getCardProducts,
    required this.getItemsUseCase,
    required this.deleteItemUseCase,
    required this.changeAmountUseCase,
  });

  // get builder's ids
  final cardsId = 'cards_id'; // main id of list bottom of specialist text
  final offersId = 'offers_id'; // id of each item
  final bottomButtonId = 'bottom_button_id'; // total sum's id in bottom bar
  final counterInOffersId = 'counter_in_offers_id'; //id of counter between plus and minus in offers item

  // states
  var cardsState = CardState.initial;
  var offersState = CardState.initial;
  var bottomTotalState = CardState.initial;

  // total product cost
  int totalCost = 0;
  int totalDiscount = 0;

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

  increaseAmount(int responsibleID, int offerID) {
    List<SpecialistItemModel>? list = cardProductsMap[responsibleID];
    int qty = list?.firstWhere((element) => element.offering?.id == offerID).qty ?? 0;
    qty += 1;
    changeAmount(offerID, qty);
  }

  decreaseAmount(int responsibleID, int offerID) {
    List<SpecialistItemModel>? list = cardProductsMap[responsibleID];
    int qty = list?.firstWhere((element) => element.offering?.id == offerID).qty ?? 0;
    if(qty > 1){
      qty -= 1;
    }else {
      qty = 0;
    }
      changeAmount(offerID, qty);
  }


  changeAmount(int offerID, int amount) async {
   final res = await changeAmountUseCase.call(ChangeAmountParams(offerID: offerID, amount: amount));
   res.fold((failure) {

   }, (response) => {
     getCardItems(),
     updateCounter()
   });
  }

  deleteFromList(int responsibleID, int offeringId) {
    deleteItemUseCase.call(DeleteCartProductParams(id: offeringId, amount: 0));
    getCardItems();
  }

  getTotal(int responsibleID, int offerID) {
    List<SpecialistItemModel>? list = cardProductsMap[responsibleID];
    int? total = list?.firstWhere((element) => element.offering?.id == offerID).qty;
    return total;
  }

  getItems(String orgSlugName, int responsible) async {
    if (cardProductsMap.containsKey(responsible)) {

    } else {
      final res = await getItemsUseCase.call(GetItemsUseCaseParams(
          org_slug_name: orgSlugName, responsible: responsible));
      res.fold((failure) {
        Get.log("failure: $failure");
        if (failure is NetworkFailure) {}
      }, (response) {
        cardProductsMap[responsible] = response;
        cardProducts.addAll(response);
        final list = cardProductsMap[responsible];
        calculateEachList(list!);
        updateCardsState(CardState.loaded);
      });
     // calculateCost();
    }
  }

  calculateEachList(List<SpecialistItemModel> list ) {
    list.forEach((element) {
      totalCost += element.totalCost!;
      totalDiscount += (element.offering?.discount ?? 0) as int;
    });
  }

  void getCardItems() async {
    updateCardsState(CardState.loading);
    updateBottomTotal(CardState.loading);
    updateOffersState(CardState.loading);
    final res = await getCardProducts.call(NoParams());
    res.fold((failure) {
      Get.log("failure: $failure");
      if (failure is NetworkFailure) {}
      updateCardsState(CardState.error);
      updateBottomTotal(CardState.error);
      updateOffersState(CardState.error);
    }, (response) {
      orderList = response;
      for (var element in orderList) {
        if (element.seller?.specialists != null) {
          for (var specialist in element.seller!.specialists!) {
            getItems(element.seller?.slugName ?? "jd_poliklinika",
                specialist.id ?? 122);

          }
        }
      }
      updateCardsState(CardState.loaded);
      updateBottomTotal(CardState.loaded);
      updateOffersState(CardState.loaded);
      updateCounter();
    });
  }

  void updateCounter() {
    Get.log("counter updated");
    update([counterInOffersId]);
  }

  void updateBottomTotal(CardState state) {
    Get.log("bottom total:  updated   $state");
    bottomTotalState = state;
    update([bottomButtonId]);
  }

  void updateCardsState(CardState state) {
    Get.log("cards state:  updated   $state");
    cardsState = state;
    update([cardsId]);
  }

  void updateOffersState(CardState state) {
    Get.log("offers state:  updated   $state");
    offersState = state;
    update([offersId]);
  }
}

enum CardState { initial, loading, error, loaded }
