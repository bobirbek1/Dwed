import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/presentation/pages/cart/presentation/controller/card_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BottomButtonWidget extends StatefulWidget {
  int total;

  BottomButtonWidget({
    required this.total,
  });

  @override
  State<StatefulWidget> createState() {
    return BottomButtonWidgetState();
  }
}

class BottomButtonWidgetState extends State<BottomButtonWidget> {

  final cardController = Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text(
                    'Price',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  GetBuilder(
                    init: cardController,
                    id: cardController.checkoutId,
                    builder: (context) {
                      return  Text(
                        '40 000 uzs',
                         style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      );
                    }
                  )
                ],
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Checkout'),
              ),
              width: double.infinity,
              height: 56,
            ),
          ],
        ));
  }
}
