import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_icons.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.ARROW_LEFT,
                color: Colors.black,
              )),
          'Checkout'),
      body: Column(
        children: [
          getSettings(getList()),
          getComment(),
          getSummary(getSummaryInformations()),
          buildBottomButton(),
        ],
      ),
    );
  }

  Widget buildBottomButton() {
    return Container(
        width: double.infinity,
        height: 56,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
          ],
        ),
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Checkout'),
          ),
          width: double.infinity,
        ));
  }

  Widget getComment() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Comment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16),
              child: Text('write your comment'),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
          child: Divider(
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  List<SummaryItem> getSummaryInformations() {
    return [
      SummaryItem(
          title: 'Price', description: '123 333 22 uzs', color: Colors.black),
      SummaryItem(
          title: 'Delivery',
          description: '123 333 22 uzs',
          color: Colors.black),
      SummaryItem(
          title: 'Discount', description: '123 333 22 uzs', color: Colors.red),
      SummaryItem(
          title: 'Total Price',
          description: '123 333 22 uzs',
          color: Colors.black),
    ];
  }

  Widget getSummary(List<SummaryItem> list) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        ...list.map((e) => getSummaryDetails(e.color, e.title, e.description))
      ],
    );
  }

  Widget getSummaryDetails(Color color, String type, String sum) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.only(left: 16, top: 8),
        child: Text(
          type,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16, color: color),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 16, top: 8),
        child: Text(
          sum,
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 16, color: color),
        ),
      )
    ]);
  }

  List<Settings> getList() {
    return [
      Settings(
          title: 'Deliver Method',
          description:
              'if you do not select a delivery  method, the system will take the default value'),
      Settings(
          title: 'Meeting Time',
          description:
              'if you do not select a delivery  method, the system will take the default value'),
      Settings(
          title: 'Payment Method',
          description:
              'if you do not select a delivery  method, the system will take the default value'),
      Settings(
          title: 'Coupons',
          description:
              'if you do not select a delivery  method, the system will take the default value'),
    ];
  }

  Widget getSettings(List<Settings> list) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [...list.map((e) => getListItem(e))],
        ),
      ),
    );
  }

  Widget getListItem(Settings item) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    item.description,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            )),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.ARROW_LEFT,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
          child: Divider(
            color: Colors.black,
          ),
        ),
      ],
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
            fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class SummaryItem {
  final String title;
  final String description;
  final Color color;

  SummaryItem({
    required this.title,
    required this.description,
    required this.color,
  });
}

class Settings {
  final String title;
  final String description;

  Settings({required this.title, required this.description});
}
