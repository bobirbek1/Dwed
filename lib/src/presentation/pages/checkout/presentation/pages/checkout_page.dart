import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/checkout/presentation/controller/checkout_page_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../../../../../app/app_icons.dart';

class CheckoutPage extends StatelessWidget {
  final _controller = Get.find<CheckoutPageController>();
  final TextEditingController _textEditingController = TextEditingController(text: 'I liked the App',);

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
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: SingleChildScrollView(child: buildBodySection()),
              ),
            ),
            buildBottomButton()
          ],
        ));
  }

  Widget buildBodySection() {
    return Column(
      children: [
        buildDelivery(),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        buildMeetingTime(),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        buildPaymentMethod(),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        buildCoupons(),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        buildComment(),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        buildSummary()
      ],
    );
  }

  Widget buildDelivery() {
    return SizedBox(
        height: SizeConfig.calculateBlockVertical(64),
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    'Delivery Method',
                    style: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(16),
                        fontWeight: FontWeight.w500),
                  )),
                  SizedBox(
                    height: SizeConfig.calculateTextSize(6),
                  ),
                  Text(
                    'If you don’t select a delivery method, the system will take the default location',
                    style: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(12),
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: SizeConfig.calculateTextSize(5),
                  ),
                  Container(
                    color: Colors.black12,
                    height: 1,
                  ),
                ],
              )),
              SvgPicture.asset(AppIcons.ARROW_RIGHT)
            ],
          ),
        ));
  }

  Widget buildMeetingTime() {
    return SizedBox(
        height: SizeConfig.calculateBlockVertical(64),
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                            'Meeting Time',
                            style: TextStyle(
                                fontSize: SizeConfig.calculateTextSize(16),
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: SizeConfig.calculateTextSize(6),
                      ),
                      Text(
                        'If you don’t select a time, the system will select it automatically',
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(12),
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(
                        height: SizeConfig.calculateTextSize(5),
                      ),
                      Container(
                        color: Colors.black12,
                        height: 1,
                      ),
                    ],
                  )),
              SvgPicture.asset(AppIcons.ARROW_RIGHT)
            ],
          ),
        ));
  }

  Widget buildPaymentMethod() {
    return SizedBox(
        height: SizeConfig.calculateBlockVertical(64),
        child: InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.PAYMENTMETHOD);
          },
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                            'Payment Method',
                            style: TextStyle(
                                fontSize: SizeConfig.calculateTextSize(16),
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: SizeConfig.calculateTextSize(6),
                      ),
                      Text(
                        'Select a payment method',
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(12),
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(
                        height: SizeConfig.calculateTextSize(5),
                      ),
                      Container(
                        color: Colors.black12,
                        height: 1,
                      ),
                    ],
                  )),
              SvgPicture.asset(AppIcons.ARROW_RIGHT)
            ],
          ),
        ));
  }

  Widget buildCoupons() {
    return SizedBox(
        height: SizeConfig.calculateBlockVertical(64),
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                            'Coupons',
                            style: TextStyle(
                                fontSize: SizeConfig.calculateTextSize(16),
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: SizeConfig.calculateTextSize(6),
                      ),
                      Text(
                        'coupon',
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(12),
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(
                        height: SizeConfig.calculateTextSize(5),
                      ),
                      Container(
                        color: Colors.black12,
                        height: 1,
                      ),
                    ],
                  )),
              SvgPicture.asset(AppIcons.ARROW_RIGHT)
            ],
          ),
        ));
  }

  Widget buildComment() {
    return SizedBox(
        height: SizeConfig.calculateBlockVertical(74),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                          'Comment',
                          style: TextStyle(
                              fontSize: SizeConfig.calculateTextSize(16),
                              fontWeight: FontWeight.w500),
                        )),
                    SizedBox(
                      height: SizeConfig.calculateTextSize(6),
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(17),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        cursorColor: Colors.black38,
                        controller: _textEditingController,
                        decoration: const InputDecoration(border: InputBorder.none),
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(12),
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.calculateTextSize(5),
                    ),
                    Container(
                      color: Colors.black12,
                      height: 1,
                    ),
                  ],
                )),
            SvgPicture.asset(AppIcons.ARROW_RIGHT)
          ],
        ));
  }

  Widget buildSummary() {
    return Column(
      children: [
        SizedBox(height: SizeConfig.calculateBlockVertical(24),),
        Row(
          children: [
            Text('Summary', style: TextStyle(fontWeight: FontWeight.w500, fontSize: SizeConfig.calculateTextSize(18)),),
            const Expanded(child: SizedBox())
          ],
        ),
        SizedBox(height: SizeConfig.calculateBlockVertical(14),),
        Row(
          children: [
            Text('Price', style: TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConfig.calculateTextSize(16 )),),
            const Expanded(child: SizedBox()),
            Text('${_controller.getPrice()}  UZS', style: TextStyle(fontWeight: FontWeight.w500, fontSize: SizeConfig.calculateTextSize(16 )),),
          ],
        ),
        SizedBox(height: SizeConfig.calculateBlockVertical(14),),
        Row(
          children: [
            Text('Delivery', style: TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConfig.calculateTextSize(16 )),),
            const Expanded(child: SizedBox()),
            Text('${_controller.getDeliverySum()} UZS', style: TextStyle(fontWeight: FontWeight.w500, fontSize: SizeConfig.calculateTextSize(16 )),),
          ],
        ),
        SizedBox(height: SizeConfig.calculateBlockVertical(14),),
        Row(
          children: [
            Text('Discount', style: TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConfig.calculateTextSize(16 ), color: Colors.redAccent),),
            const Expanded(child: SizedBox()),
            Text('${_controller.getDiscountSum()} UZS', style: TextStyle(fontWeight: FontWeight.w500, fontSize: SizeConfig.calculateTextSize(16 ), color: Colors.redAccent),),
          ],
        ),
        SizedBox(height: SizeConfig.calculateBlockVertical(14),),
        Row(
          children: [
            Text('Total Price', style: TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConfig.calculateTextSize(16 ),),),
            const Expanded(child: SizedBox()),
            Text('${_controller.getTotalSum()} UZS', style: TextStyle(fontWeight: FontWeight.w500, fontSize: SizeConfig.calculateTextSize(16 ),),),
          ],
        ),

      ],
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
            onPressed: () {
              _controller.comment = _textEditingController.text;
              Get.toNamed(AppRoutes.CHECKOUTORDEREDPAGE);
            },
            child: const Text('Place order'),
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
