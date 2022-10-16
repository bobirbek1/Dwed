import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/checkout_payment_method_1/checkout_payment_method_1_page.dart';

class ListItem extends StatefulWidget {
  final BankItem item;

  ListItem({required this.item});

  @override
  State<StatefulWidget> createState() {
    return ListItemState(item: item);
  }

}

class ListItemState extends State<ListItem> {
  final BankItem item;
  bool _clicked = false;

  ListItemState({required this.item,});


  @override
  Widget build(BuildContext context) {
    return Container(
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

                  Text(item.discount, style: const TextStyle(
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
    );
  }

}