import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/information/cards_widget.dart';

import '../../../../app/app_icons.dart';

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: getAppBar(IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppIcons.ARROW_LEFT,
            color: Colors.black,
          )), 'Information check'),

      body: Padding(padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(child: Column(
                  children: [
                    buildStatuses(getList()),
                    
                    buildListView(getSmartPhoneList()),
                  ],
                )),

                buildBottomButton()
              ],
            ),
          )
    );
  }

  
  List<SmartPhoneItem> getSmartPhoneList() {
    return[
      SmartPhoneItem(path: 'assets/images/phone.png', description: 'Smartphone iPhone 12 Pro 128GB Graphite', price: '1 x 11 124 000 UZS'),
    ];
  }

  Widget buildListView(List<SmartPhoneItem> list) {
    return Expanded(child: ListView.builder(
        itemBuilder: (ctx, index) => buildListItem(list[index]),
      itemCount: list.length,
    ));
  }

  Widget buildListItem(SmartPhoneItem item) {
    return Column(
      children: [
        const SizedBox(height: 8,),
        Row(
          children: [
            Image.asset(item.path),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.description, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                Text(item.price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),maxLines: 2,overflow: TextOverflow.ellipsis,),
              ],
            )
          ],
        ),

        const Divider(
          color: Colors.black12,
          thickness: 0.5,
        ),
      ],
    );
  }
  
  List<StatusItem> getList() {
    return [
      StatusItem(title: 'Order status:', description: 'Pending'),
      StatusItem(title: 'Organizations:', description: 'OT’Y AO O’zbekiston Temir yo’llari oilaviy shifoxonasi'),
      StatusItem(title: 'Specialist:', description: 'Alimukhammedova'),
      StatusItem(title: 'Payment method:', description: 'Payme'),
      StatusItem(title: 'Price:', description: '900 000 UZS'),
      StatusItem(title: 'Discount:', description: '900 000 UZS'),
      StatusItem(title: 'Total price:', description: ' 0 UZS'),
    ];
  }

  Widget buildStatuses(List<StatusItem> list) {
    return Column(
      children: [
        ...list.map((e) => buildStatusItem(e)).toList()
      ],
    );
  }

  Widget buildStatusItem(StatusItem item) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.calculateBlockVertical(16),),
        Row(
          children: [
            Text(item.title, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),
            Expanded(child: SizedBox()),
            Expanded(child: Text(item.description, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12, ),textAlign: TextAlign.right,))
          ],
        ),
      ],
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

            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
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
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
  
}

class StatusItem{
  final String title;
  final String description;

  StatusItem({
    required this.title,
    required this.description,
  });
}

class SmartPhoneItem{
  final String path;
  final String description;
  final String price;

  SmartPhoneItem ({
    required this.path,
    required this.description,
    required this.price,
  });
}