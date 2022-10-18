import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/checkout_payment_method_1/add_cards_page.dart';
import 'package:flutter_template/src/presentation/pages/checkout_payment_method_1/checkout_payment_method_1_page.dart';

import '../information/cards_widget.dart';

class ListItem extends StatefulWidget {
  final BankItem item;
  final Function function;

  ListItem({required this.item, required this.function});

  @override
  State<StatefulWidget> createState() {
    return ListItemState(item: item, function: function);
  }

}

class ListItemState extends State<ListItem> {
  final BankItem item;
  bool _clicked = false;
  final Function function;

  ListItemState({required this.item,required this.function});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {if(_clicked)showAddBottomSheet(context); },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _clicked = !_clicked;
                  });
                },
                child: Row(
                  children: [
                    Image.asset(item.picPath),

                    const SizedBox(width: 12,),

                    Expanded(
                      child: Text(item.title, style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),),
                    ),

                    _clicked? Image.asset('assets/images/tick-circle.png') : Text(item.discount, style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),),

                    const SizedBox(width: 16,)
                  ],
                ),
              ),

              _clicked? const Divider(
                  color: Colors.black12,
                  thickness: 0.5,
                ) : const SizedBox(),

              _clicked? Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    SizedBox(width: SizeConfig.calculateBlockHorizontal(8)),

                    Image.asset('assets/images/uzcart_logo.png'),

                    SizedBox(width: SizeConfig.calculateBlockHorizontal(12.37)),

                    const Text('8600 **** **** 7648 - Card name', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),

                    const Expanded(child: SizedBox()),

                    InkWell(
                      onTap: () {

                      },
                        child: Image.asset('assets/images/arrov_right.png')),


                    SizedBox(width: SizeConfig.calculateBlockHorizontal(20.58)),
                  ],
                ),
              ) : const SizedBox()


            ],
          ),
        ),
        width: double.infinity,
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context, builder: (bCtx){
      return CardsWidget();
    });
  }

  void showAddBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context, builder: (bCtx){
      return AddCardsWidget();
    });
  }
}