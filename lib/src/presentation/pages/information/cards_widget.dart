import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class CardsWidget extends StatefulWidget {
  const CardsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CardsWidgetState();
  }
}

class CardsWidgetState extends State<CardsWidget> {
  @override
  Widget build(BuildContext context) {
    var list = getList();

    return SizedBox(
      height: SizeConfig.calculateBlockVertical(list.length < 3 ? 200 : 300),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
          ),
          const Text(
            'Cards',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(8),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) {
              return ListTile(
                  leading: Image.asset(list[index].path),
                  title: Text(
                    list[index].text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ));
            },
            itemCount: list.length,
          )),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0, top: 8),
            child: ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text(
                'Karta qo’shish',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<CartItem> getList() {
    return [
      CartItem(
          path: 'assets/images/uzcart_logo.png',
          text: '8600 **** **** 1578 - Card Name'),
      CartItem(
          path: 'assets/images/uzcart_logo.png',
          text: '8600 **** **** 1578 - Card Name'),
      CartItem(
          path: 'assets/images/humo_logo.png',
          text: '8600 **** **** 1578 - Card Name'),
    ];
  }
}

class CartItem {
  final String path;
  final String text;

  CartItem({
    required this.path,
    required this.text,
  });
}
