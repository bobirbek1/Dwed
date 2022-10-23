import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/core/utils/size_config.dart';

import '../../../../../../app/app_icons.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          Expanded(
              child: Column(
            children: [
              getSettings(getList()),
            ],
          )),
          buildBottomButton()
        ],
      ),
    );
  }

  Widget getCommentSection() {
    return SizedBox(
      height: SizeConfig.calculateBlockVertical(296),
      width: double.infinity,
      child: Column(
        children: [getComment(), getSummarySection(getSummaryInformations())],
      ),
    );
  }

  getSummarySection(List<SummaryItem> list) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.calculateBlockVertical(16),
        bottom: SizeConfig.calculateBlockVertical(16),
        left: SizeConfig.calculateBlockHorizontal(16),
        right: SizeConfig.calculateBlockHorizontal(16),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Summary',
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(2),
          ),
          ...list.map((e) => buildSummaries(e)).toList(),
        ],
      ),
    ));
  }

  buildSummaries(SummaryItem item) {
    Row(
      children: [
        SizedBox(height: SizeConfig.calculateBlockVertical(12)),
        Text(
          item.title,
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(16),
              fontWeight: FontWeight.w400),
        ),
        const Expanded(child: SizedBox()),
        Text(
          item.description,
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(12),
              fontWeight: FontWeight.w500,
              color: item.color),
        ),
      ],
    );
  }

  getComment() {
    return SizedBox(
      height: SizeConfig.calculateBlockVertical(82.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Comment',
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w500)),
          Text('Comment',
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w500)),
          Container(
            height: 1,
            color: Colors.black87,
          )
        ],
      ),
    );
  }

  Widget getSettings(List<Settings> list) {
    return SizedBox(
      height: SizeConfig.calculateBlockVertical(319.5),
      width: double.infinity,
      child: Column(
        children: [...list.map((e) => buildSettings(e)).toList()],
      ),
    );
  }

  Widget buildSettings(Settings item) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.calculateBlockVertical(16),
        bottom: SizeConfig.calculateBlockVertical(16),
        left: SizeConfig.calculateBlockHorizontal(16),
        right: SizeConfig.calculateBlockHorizontal(16),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(item.title,
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(6),
              ),
              Expanded(
                  child: Text(item.description,
                      style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(12),
                          fontWeight: FontWeight.w300))),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(6),
              ),
              Container(
                height: 1,
                color: Colors.black87,
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          Image.asset('assets/images/arrov_right.png')
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
