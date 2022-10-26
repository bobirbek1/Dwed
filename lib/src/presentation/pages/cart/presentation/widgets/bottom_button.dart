// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/cart/presentation/controller/card_controller.dart';
import 'package:get/get.dart';
//
// class BottomButtonWidget extends StatefulWidget {
//   int total;
//
//   BottomButtonWidget({
//     Key? key,
//     required this.total,
//   }) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return BottomButtonWidgetState();
//   }
// }
//
// class BottomButtonWidgetState extends State<BottomButtonWidget> {
//   final cardController = Get.find<CardController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: double.infinity,
//         margin: EdgeInsets.only(
//           left: 16,
//           right: 16,
//           bottom: SizeConfig.calculateBlockVertical(88),
//         ),
//         decoration: const BoxDecoration(
//           boxShadow: [ BoxShadow(offset: Offset(3, 8), blurRadius: 5.0), ],
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Price',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
//                   ),
//                   GetBuilder(
//                       init: cardController,
//                       id: cardController.checkoutId,
//                       builder: (context) {
//                         return Text(
//                           '${widget.total} uzs',
//                           style: const TextStyle(
//                               fontWeight: FontWeight.w600, fontSize: 18),
//                         );
//                       })
//                 ],
//               ),
//             ),
//             SizedBox(
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: const Text('Checkout'),
//               ),
//               width: double.infinity,
//               height: 56,
//             ),
//           ],
//         ));
//   }
// }
