import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

import '../../../../../data/model/models/orders_card_model.dart';
import '../../../../controller/cart/controller/card_controller.dart';

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
            final data = _controller.orderList as List<OrdersCardModel>;
            Get.log(
                "state: ${_controller.cardsState}, data: ${_controller.orderList}");
            return Column(
              children: [
                GetBuilder(
                  id: _controller.cardsId,
                  init: _controller,
                  builder: (context) {
                    return buildListView(data);
                  }
                ),

               getBottomButton(_controller.totalCost)

              ],
            );
          }),
    );
  }

  Widget buildListView(List<OrdersCardModel> list) {
    return Expanded(
      child: _controller.cardsState == CardState.loading ?
          const Center(
            child: CircularProgressIndicator(
              value: null,
              strokeWidth: 5.0,
            ),
          ) :
      SingleChildScrollView(
        child: Column(children: [
          ...List.generate(
            list.length,
            (index) => buildListItem(
                list[index], index == list.length - 1 ? false : true),
          ),
          const SizedBox(
            height: 16,
          ),
        ]),
      ),
      // ListView.builder(
      //   itemBuilder: (ctx, index) {
      //     return
      //   },
      //   itemCount: list.length,
      // ),
    );
  }

  Widget buildListItem(OrdersCardModel item, bool bool) {
    final itemLength = item.seller?.specialists?.length != null
        ? item.seller!.specialists!.length * 2 - 1
        : 0;
    return Column(
      children: [
        buildContainer(getAddsRow(item.seller!)),
        ...List.generate(
          itemLength,
          (index) => index.isEven
              ? getSpecialist(
                  item.seller!.specialists![index ~/ 2],
                )
              : const SizedBox(height: 16),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const SizedBox(
                    height: 4,
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
          const SizedBox(
            height: 24,
          ),
          getOffersText(),
          buildOffers(
            specialist.id ?? 0,
          ),
        ],
      ),
    );
  }

  Widget getOffersText() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 12),
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
        id: _controller.offersId,
        builder: (context) {
          final data = _controller.cardProductsMap[id];
          return _controller.offersState == CardState.loading ?
          buildContainer(const SizedBox(
                    height: 50,
                    child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 5.0,
                    ),
                  ),
          )
              : Column(
                  children: List.generate(
                      data?.length != null ? data!.length + data.length - 1 : 0,
                      (index) {
                    final data = _controller.cardProductsMap[id]?[index ~/ 2];
                    return index.isEven
                        ? SizedBox(
                            height: SizeConfig.calculateBlockVertical(100),
                            child: Row(
                              children: [
                                Image.network(
                                  data!.offering!.image!,
                                  width:
                                      SizeConfig.calculateBlockHorizontal(100),
                                  height:
                                      SizeConfig.calculateBlockVertical(100),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.responsible?.user?.fullName ??
                                            "- - - -",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        (data.offering?.cost ?? 0).toString() +
                                            " UZS",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      buildCounterWidget(
                                          id, data.offering!.id!),
                                      if ((data.offering?.maxQty ?? 0) <=
                                          _controller.getTotal(
                                              data.responsible?.id ?? 0,
                                              data.offering!.id!))
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
                            ),
                          )
                        : const Divider(
                            color: AppColors.GREY,
                            thickness: 1,
                            height: 32,
                          );
                  }),
                );
        });
  }

  buildCounterWidget(int id, int offerId) {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(24),
          height: SizeConfig.calculateBlockVertical(24),
          child: OutlinedButton(
            onPressed: () {
              _controller.decreaseAmount(id, offerId);
            },
            style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
              "-",
              style: TextStyle(fontSize: 16, color: AppColors.BLACK),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(16),
        ),
        GetBuilder(
            id: _controller.counterInOffersId,
            init: _controller,
            builder: (context) {
              return Text(_controller.getTotal(id, offerId).toString());
            }),
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(16),
        ),
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(24),
          height: SizeConfig.calculateBlockVertical(24),
          child: OutlinedButton(
            onPressed: () {
              _controller.increaseAmount(id, offerId);
            },
            style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
              "+",
              style: TextStyle(fontSize: 16, color: AppColors.BLACK),
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        InkWell(
          child: SvgPicture.asset('assets/icons/trash.svg'),
          onTap: () {
            _controller.deleteFromList(id, offerId);
          },
        )
      ],
    );
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

  Widget getBottomButton(int totalCost) {
    totalCost = _controller.totalCost;
    return PhysicalModel(
      color: Colors.white,
      elevation: 20,
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: SizeConfig.calculateBlockVertical(88),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GetBuilder(
                  init: _controller,
                  id: _controller.bottomTotalState,
                  builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Price',
                          style:
                              TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                        _controller.bottomTotalState == CardState.loading
                            ? const Text(
                                'loading...',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.blueAccent),
                              )
                            : Text(
                                '${_controller.totalCost} UZS',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              )
                      ],
                    );
                  }
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.CHECKOUTPAGE);
                  },
                  child: const Text('Checkout'),
                ),
                width: double.infinity,
                height: 56,
              ),
            ],
          )),
    );
  }
}
