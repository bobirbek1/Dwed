import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/checkout_payment_method_1/presentation/widgets/add_cards_page.dart';
import 'package:flutter_template/src/presentation/pages/checkout_payment_method_1/presentation/widgets/list_item.dart';
import 'package:get/get.dart';

class MethodFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: getAppBar(
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(
                AppIcons.ARROW_LEFT,
                color: Colors.black,
              )),
          'Payment Method'),
      body: Padding(
        padding: EdgeInsets.all(16),
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
      BankItem(
          title: '',
          discount: '1% cashback',
          picPath: AppImages.ICON_ANOR_BANK),
      BankItem(
          title: '', discount: '', picPath: AppImages.ICON_PAY_ME),
      BankItem(
          title: 'Naqd Pul',
          discount: '',
          picPath: AppImages.ICON_NAQD_PUL),
      BankItem(
          title: 'Terminal',
          discount: '',
          picPath: AppImages.ICON_TERMINAL),
      BankItem(
          title: 'Muddatli To\'lov',
          discount: '',
          picPath: AppImages.ICON_MUDDATLI),
    ];
  }

  buildListView(List<BankItem> list) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            const SizedBox(height: 16),
            ListItem(
              item: list[index],
              function: showBottomSheet,
            ),
          ],
        );
      },
      itemCount: list.length,
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return AddCardsWidget();
        });
  }

  Widget buildBottomButton() {
    return Container(
        width: double.infinity,
        height: 56,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
          ],
        ),
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.CHECKOUTORDEREDPAGE);
            },
            child: const Text('Select'),
          ),
          width: double.infinity,
        ));
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

class BankItem {
  final String title;
  final String discount;
  final String picPath;

  BankItem({
    required this.title,
    required this.discount,
    required this.picPath,
  });
}
