
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/checkout_payment_method_1/list_item.dart';

import '../../../../app/app_icons.dart';

class MethodFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: getAppBar(IconButton(onPressed: () {}, icon: SvgPicture.asset(
        AppIcons.ARROW_LEFT,
        color: Colors.black,
      )),
        'Payment Method'
      ),
      
      body: Padding(padding:EdgeInsets.all(16),
        child: Column(
          children: [

            Expanded(child: buildListView(getBankItemList())),

            buildBottomButton()
          ],
        ),
      ),
    );
  }

  getBankItemList() {
    return [
      BankItem(title: '', discount: '1% cashback', picPath: 'assets/images/anorbank_logo.png'),
      BankItem(title: '', discount: '', picPath: 'assets/images/payme_logo.png'),
      BankItem(title: 'Naqd Pul', discount: '', picPath: 'assets/images/naqdpul_logo.png'),
      BankItem(title: 'Terminal', discount: '', picPath: 'assets/images/terminal_logo.png'),
      BankItem(title: 'Muddatli To\'lov', discount: '', picPath: 'assets/images/muddatlitolov_logo.png'),
    ];
  }

  buildListView(List<BankItem> list) {
    return ListView.builder(itemBuilder: (ctx, index) {
      return Column(
        children: [
          const SizedBox(height: 16),

          ListItem(item: list[index]),
        ],
      );
    },
    itemCount: list.length,
    );
  }




  Widget buildBottomButton() {
    return Container(
        width: double.infinity,
        height: 56,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.white,
              blurRadius: 10,
              offset: Offset(4, 8) ),
        ],

        ),
        child : SizedBox(
          child: ElevatedButton(
            onPressed: () {

            },
            child: const Text('Select'),
          ),
          width: double.infinity,
        )
    );
  }


  AppBar getAppBar(Widget leading, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }

}

class BankItem{
  final String title;
  final String discount;
  final String picPath;

  BankItem({
    required this.title,
    required this.discount,
    required this.picPath,
  });

}