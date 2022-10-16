import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';

import '../../../../app/app_colors.dart';

class CartPage extends StatelessWidget {
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
          'Cart'),
      body: Column(
        children: [

          buildContainer(getAddsRow(AddsItem(
              picUrl:
                  'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
              webUrl: 'Olcha.uz',
              title: 'Internet shop',
              icon: Icon(Icons.add)))),

          getSpecialistText(),

          getSpecialist(SpecialistItem(
              picUrl:
                  'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
              name: 'Eshdavlat Umidjon',
              position: 'Salesman',
              icon: Icon(Icons.add))),

          getOffersText(),
          buildListView(getList()),
          buildBottomButton()
        ],
      ),
    );
  }

  Widget getOffersText() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16.0, bottom: 12),
      child: const Text(
        'Offers',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget getSpecialistText() {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: const [
            Expanded(
              child: Text(
                'Specialist in charge of offers',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ));
  }

  Widget getSpecialist(SpecialistItem item) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(item.picUrl),
            ),
            SizedBox(
              width: SizeConfig.calculateBlockHorizontal(16),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ), //),

                Text(
                  item.position,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ));
  }

  List<ListItem> getList() {
    return [
      ListItem(
          title: 'Smartphone Iphone 12 Pro 128 GB Graphite',
          imageUrl:
              'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
          price: '12 000 000',
          maxOrderLimit: '15'),
      ListItem(
          title: 'Smartphone Iphone 12 Pro 128 GB Graphite',
          imageUrl:
              'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
          price: '12 000 000',
          maxOrderLimit: '15'),
      ListItem(
          title: 'Smartphone Iphone 12 Pro 128 GB Graphite',
          imageUrl:
              'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
          price: '12 000 000',
          maxOrderLimit: '15'),
      ListItem(
          title: 'Smartphone Iphone 12 Pro 128 GB Graphite',
          imageUrl:
              'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
          price: '12 000 000',
          maxOrderLimit: '15'),
      ListItem(
          title: 'Smartphone Iphone 12 Pro 128 GB Graphite',
          imageUrl:
              'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
          price: '12 000 000',
          maxOrderLimit: '15'),
    ];
  }

  Widget buildListView(List<ListItem> list) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (ctx, index) {
        return buildListItem(
            list[index], index == list.length - 1 ? false : true);
      },
      itemCount: list.length,
    ));
  }

  Widget buildListItem(ListItem item, bool bool) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/phone.png'),
            ),
            SizedBox(
              width: SizeConfig.calculateBlockHorizontal(17),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 4),
                  child: Text(
                    item.title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  item.price,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: SizeConfig.calculateBlockVertical(12),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: SizeConfig.calculateBlockHorizontal(24),
                          height: SizeConfig.calculateBlockVertical(24),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.ANTI_FLASH_WHITE, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            '/assets/icons/icon_minus.svg',
                            color: Colors.black12,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(16),
                        ),
                        const Text(
                          '10',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(16),
                        ),
                        Container(
                          width: SizeConfig.calculateBlockHorizontal(24),
                          height: SizeConfig.calculateBlockVertical(24),
                          // padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.ANTI_FLASH_WHITE, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset('assets/icons/icon_add.svg'),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.delete_outline),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0, top: 8),
          child: Text(
            'max order limit',
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.redAccent),
          ),
        ),
        bool
            ? const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16),
                child: Divider(
                  color: Colors.black12,
                  thickness: 0.5,
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget buildBottomButton() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Price',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    '10 250 000 uzs',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Checkout'),
              ),
              width: double.infinity,
              height: 56,
            ),
          ],
        ));
  }

  Widget getAddsRow(AddsItem addsItem) {
    return Row(
      children: [
        Container(
          child: AspectRatio(
            aspectRatio: 1.0 / 1.0,
            child: FittedBox(
              fit: BoxFit.contain,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/olcha_logo.png',
                ),
              ),
            ),
          ),
          height: SizeConfig.calculateBlockVertical(48),
          width: SizeConfig.calculateBlockHorizontal(48),
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //SizedBox(child :
                        Text(
                          addsItem.webUrl,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ), //),
                        addsItem.icon
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SizedBox(child :
                        Text(
                          addsItem.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ) //),
                      ],
                    )
                  ],
                ))),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: const Text('View'),
        ),
      ],
    );
  }

  Widget buildContainer(Widget widget) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      child: widget,
      height: 72,
      width: double.infinity,
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

class SpecialistItem {
  final String picUrl;
  final String name;
  final String position;
  final Icon icon;

  SpecialistItem({
    required this.picUrl,
    required this.name,
    required this.position,
    required this.icon,
  });
}

class AddsItem {
  final String picUrl;
  final String webUrl;
  final String title;
  final Icon icon;

  AddsItem({
    required this.picUrl,
    required this.webUrl,
    required this.title,
    required this.icon,
  });
}

class ListItem {
  final String title;
  final String imageUrl;
  final String price;
  final String maxOrderLimit;

  ListItem({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.maxOrderLimit,
  });
}
