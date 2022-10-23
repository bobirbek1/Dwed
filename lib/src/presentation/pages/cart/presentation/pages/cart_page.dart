import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/models/orders_card_model.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/models/specialist_item.dart';
import 'package:flutter_template/src/presentation/pages/cart/presentation/widgets/bottom_button.dart';
import 'package:flutter_template/src/presentation/pages/cart/presentation/widgets/counter_widget.dart';
import 'package:get/get.dart';
import '../controller/card_controller.dart';

class CartPage extends StatelessWidget {
  final _controller = Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _controller.getCardItems();

    return Scaffold(
      appBar: getAppBar(
          IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                AppIcons.ARROW_LEFT,
                color: Colors.black,
              )),
          'Cart'),
      body: Column(
        children: [
          GetBuilder(
              init: _controller,
              id: _controller.mainListId,
              builder: (context) {
                return buildListView(getList());
              }),
          buildBottomButton(_controller.totalCost)
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

  Widget getSpecialist(Specialists item, String slugName) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            getSpecialistText(),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(item.user!.avatar!),
                ),
                SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(16),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          item.user!.fullName!,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                            width: SizeConfig.calculateBlockHorizontal(5.33)),
                        item.user!.isOfficial!
                            ? SizedBox(
                                width:
                                    SizeConfig.calculateBlockHorizontal(13.33),
                                height:
                                    SizeConfig.calculateBlockVertical(13.33),
                                child:
                                    SvgPicture.asset('assets/icons/legal.svg'),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    Text(
                      item.job!.name!,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
            buildItems(
              _controller.getItems(
                slugName,
                item.id!,
              ),
            ),
          ],
        ),);
  }

  List<OrdersCardModel> getList() {
    return _controller.orderList;
  }

  Widget buildListView(List<OrdersCardModel> list) {
    return  ListView.builder(
      itemBuilder: (ctx, index) {
        return buildListItem(list[index], index == list.length - 1 ? false : true);
      },
      itemCount: list.length,
    );
  }

  Widget buildListItem(OrdersCardModel item, bool bool) {
    return Column(
      children: [
        buildContainer(getAddsRow(item.seller!)),
        ...item.seller!.specialists!
            .map((e) => getSpecialist(e, item.seller!.slugName!)),
      ],
    );
  }

  Widget buildItems(List<SpecialistItemModel> e) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Row(
          children: [
            SizedBox(
              child: Image.network(e[index].offering!.image!),
              width: SizeConfig.calculateBlockHorizontal(100),
              height: SizeConfig.calculateBlockVertical(100),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e[index].responsible!.user!.fullName!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Text(
                  e[index].offering!.cost!.toString() + " UZS",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      CounterWidget(
                        count: _controller.getTotal(
                          e[index].responsible!.id!,
                        ),
                        add: (int amount) {
                          _controller.changeAmount(
                              e[index].responsible!.id!, amount);
                        },
                        remove: () => {
                          _controller.changeAmount(
                              e[index].responsible!.id!,
                              _controller.getTotal(e[index].responsible!.id!) >
                                      0
                                  ? _controller
                                      .getTotal(e[index].responsible!.id!)
                                  : 0)
                        },
                        delete: () => {
                          _controller.changeAmount(
                              e[index].responsible!.id!,
                              _controller.getTotal(e[index].responsible!.id!) <
                                      e[index].offering!.maxQty
                                  ? _controller
                                          .getTotal(e[index].responsible!.id!) +
                                      1
                                  : _controller
                                      .getTotal(e[index].responsible!.id!))
                        },
                      ),
                      const Expanded(child: SizedBox()),
                      InkWell(
                          onTap: () {
                            _controller.deleteFromList(
                                e[index].responsible!.id!,
                                e[index].offering!.id!);
                          },
                          child: Image.asset('assets/images/trash.png'))
                    ],
                  ),
                ),
                if (e[index].offering!.maxQty ==
                    _controller.getTotal(e[index].responsible!.id!))
                  const Text(
                    'max order limit ',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.redAccent),
                  )
              ],
            ),
          ],
        );
      },
      itemCount: e.length,
    );
  }

  Widget buildBottomButton(int total) {
    return BottomButtonWidget(total: total);
  }

  Widget getAddsRow(Seller seller) {
    return Row(
      children: [
        Container(
          child: AspectRatio(
            aspectRatio: 1.0 / 1.0,
            child: FittedBox(
              fit: BoxFit.contain,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(seller.category!.image!),
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
                          seller.name!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ), //),
                        seller.isOfficial!
                            ? SizedBox(
                                width: SizeConfig.calculateBlockHorizontal(20),
                                height: SizeConfig.calculateBlockVertical(20),
                                child:
                                    SvgPicture.asset('assets/icons.legal.svg'),
                              )
                            : const SizedBox()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SizedBox(child :
                        Text(
                          seller.category!.name!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
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
