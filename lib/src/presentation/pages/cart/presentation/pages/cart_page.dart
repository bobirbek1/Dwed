import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/cart/data/models/orders_card_model.dart';
import 'package:flutter_template/src/presentation/pages/cart/presentation/widgets/bottom_button.dart';
import 'package:flutter_template/src/presentation/pages/cart/presentation/widgets/counter_widget.dart';
import 'package:get/get.dart';
import '../controller/card_controller.dart';

class CartPage extends StatelessWidget {
  final _controller = Get.find<CardController>();

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: getAppBar(
          IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                AppIcons.ARROW_LEFT,
                color: Colors.black,
              )),
          'Cart'),
      body: GetBuilder(
          init: _controller,
          id: _controller.cardsId,
          builder: (context) {
            final data = _controller.orderList;
            Get.log(
                "state: ${_controller.cardsState}, data: ${_controller.orderList}");
            return Column(
              children: [
                buildListView(data),
                BottomButtonWidget(total: _controller.totalCost)
              ],
            );
          }),
    );
  }

  Widget buildListView(List<OrdersCardModel> list) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return buildListItem(
              list[index], index == list.length - 1 ? false : true);
        },
        itemCount: list.length,
      ),
    );
  }

  Widget buildListItem(OrdersCardModel item, bool bool) {
    return Column(
      children: [
        buildContainer(getAddsRow(item.seller!)),
        ...item.seller!.specialists!.map(
          (e) => getSpecialist(
            e,
          ),
        ),
      ],
    );
  }

  Widget getAddsRow(Seller seller) {
    return Row(
      children: [
        Container(
          width: SizeConfig.calculateBlockHorizontal(48),
          height: SizeConfig.calculateBlockVertical(48),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(seller.category!.image!),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    seller.name!,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ), //),
                seller.isOfficial!
                    ? SizedBox(
                        width: SizeConfig.calculateBlockHorizontal(20),
                        height: SizeConfig.calculateBlockVertical(20),
                        child: SvgPicture.asset('assets/icons.legal.svg'),
                      )
                    : const SizedBox()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    seller.category!.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                ),
              ],
            )
          ],
        )),
        const SizedBox(
          width: 12,
        ),
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

  Widget getSpecialist(
    Specialists specialist,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSpecialistText(),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(specialist.user!.avatar!),
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
                        specialist.user!.fullName!,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(5.33)),
                      specialist.user!.isOfficial!
                          ? SizedBox(
                              width: SizeConfig.calculateBlockHorizontal(13.33),
                              height: SizeConfig.calculateBlockVertical(13.33),
                              child: SvgPicture.asset('assets/icons/legal.svg'),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  Text(
                    specialist.job!.name!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
          buildOffers(specialist.id ?? 0),
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
    return const Text(
      'Specialist in charge of offers',
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Widget buildOffers(int id) {
    return GetBuilder(
        init: _controller,
        id: _controller.cardsId,
        builder: (context) {
          final data = _controller.cardProductsMap[id];
          return Column(
            children: List.generate(data?.length ?? 0, (index) {
              final data = _controller.cardProductsMap[id]?[index];
              return Row(
                children: [
                  SizedBox(
                    child: Image.network(data!.offering!.image!),
                    width: SizeConfig.calculateBlockHorizontal(100),
                    height: SizeConfig.calculateBlockVertical(100),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.responsible?.user?.fullName ?? "- - - -",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        Text(
                          (data.offering?.cost ?? 0).toString() + " UZS",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        CounterWidget(
                          count: _controller.getTotal(
                            data.responsible!.id!,
                          ),
                          add: (int amount) {
                            _controller.changeAmount(
                                data.responsible!.id!, amount);
                          },
                          remove: () => {
                            _controller.changeAmount(
                                data.responsible!.id!,
                                _controller.getTotal(data.responsible!.id!) > 0
                                    ? _controller
                                        .getTotal(data.responsible!.id!)
                                    : 0)
                          },
                          delete: () => {
                            _controller.changeAmount(
                                data.responsible!.id!,
                                _controller.getTotal(data.responsible!.id!) <
                                        data.offering!.maxQty
                                    ? _controller
                                            .getTotal(data.responsible!.id!) +
                                        1
                                    : _controller
                                        .getTotal(data.responsible!.id!))
                          },
                        ),
                        if (data.offering!.maxQty ==
                            _controller.getTotal(data.responsible!.id!))
                          const Text(
                            'max order limit ',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.redAccent),
                          )
                      ],
                    ),
                  ),
                ],
              );
            }),
          );
        });
  }

  Widget buildContainer(Widget widget) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(16),
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
