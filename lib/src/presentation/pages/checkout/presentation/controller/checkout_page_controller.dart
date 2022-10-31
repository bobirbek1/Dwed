import 'package:flutter_template/src/presentation/pages/cart/presentation/controller/card_controller.dart';
import 'package:get/get.dart';

class CheckoutPageController extends GetxController{
  final _cartController = Get.find<CardController>();

  //data that user chose
  String comment = ' ';

  int getTotalSum() {
    return _cartController.totalCost - getDiscountSum() + getDeliverySum();
  }

  int getDeliverySum () {
    return 0;
  }

  int getDiscountSum() {
    return _cartController.totalDiscount;
  }

  int getPrice() {
    int amount =  _cartController.totalCost;
    return amount;
  }
}