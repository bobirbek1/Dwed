import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/data/model/offers/offer_model.dart';
import 'package:flutter_template/src/presentation/controller/Search/organisation_controller.dart';
import 'package:flutter_template/src/presentation/controller/offers/offers_controller.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPostPage extends StatelessWidget {
  UserPostPage({Key? key}) : super(key: key);
  final _controller = Get.find<OrganisationController>();
  final _controllerOffers = Get.find<OffersController>();

  final title = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: AppColors.WHITE,
      elevation: 0,
      leading: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.calculateBlockHorizontal(16),
              right: SizeConfig.calculateBlockHorizontal(6),
            ),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.calculateBlockVertical(12.5),
                  horizontal: SizeConfig.calculateBlockHorizontal(10),
                ),
                child: SvgPicture.asset(
                  AppIcons.ARROW_LEFT,
                  color: AppColors.BLACK,
                  fit: BoxFit.cover,
                  height: SizeConfig.calculateBlockVertical(22),
                  width: SizeConfig.calculateBlockHorizontal(7),
                ),
              ),
            ),
          ),
        ],
      ),
      title: Text(
        title.toString(),
        style: TextStyle(
          fontSize: SizeConfig.calculateTextSize(16),
          color: AppColors.BLACK,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  getBody() {
    final data = _controller.selectedOrganisationUserPost;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: SizeConfig.calculateBlockVertical(144),
          child: Stack(
            children: [
              data!.background != null
                  ? SvgPicture.string(data.background!)
                  : Image.asset(
                      AppImages.USER_POST_DETAILS,
                      width: double.infinity,
                      height: SizeConfig.calculateBlockVertical(96),
                      fit: BoxFit.cover,
                    ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.calculateBlockHorizontal(16),
                      ),
                      child: data.category!.image != null
                          ? Image.network(
                              data.category!.image!,
                              width: SizeConfig.calculateBlockHorizontal(96),
                              height: SizeConfig.calculateBlockVertical(96),
                            )
                          : Image.asset(
                              AppImages.USER_POST_PROFIL,
                              width: SizeConfig.calculateBlockHorizontal(96),
                              height: SizeConfig.calculateBlockVertical(96),
                            ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        side: const BorderSide(
                          width: 1,
                          color: AppColors.BUTTON_BLUE,
                        ),
                      ),
                      child: SizedBox(
                        width: SizeConfig.calculateBlockHorizontal(84),
                        height: SizeConfig.calculateBlockVertical(30),
                        child: Center(
                          child: Text(
                            "Message",
                            style: TextStyle(
                              fontSize: SizeConfig.calculateTextSize(12),
                              fontWeight: FontWeight.w500,
                              color: AppColors.BUTTON_BLUE,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.calculateBlockHorizontal(8),
                        right: SizeConfig.calculateBlockHorizontal(16),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(70),
                          height: SizeConfig.calculateBlockVertical(30),
                          child: Center(
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                fontSize: SizeConfig.calculateTextSize(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.calculateBlockHorizontal(16),
            top: SizeConfig.calculateBlockVertical(12),
            right: SizeConfig.calculateBlockHorizontal(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  getBodyText(
                    text: data.name ?? '------',
                    fontSize: SizeConfig.calculateTextSize(18),
                    textColor: AppColors.BLACK,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: SizeConfig.calculateBlockHorizontal(6),
                  ),
                  data.isOfficial!
                      ? SvgPicture.asset(
                          AppIcons.LEGAL,
                          width: SizeConfig.calculateBlockHorizontal(20),
                          height: SizeConfig.calculateBlockVertical(20),
                        )
                      : const SizedBox(),
                ],
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(6),
              ),
              getBodyText(
                text: data.category!.name ?? '----------',
                fontSize: SizeConfig.calculateTextSize(16),
                fontWeight: FontWeight.w400,
                textColor: AppColors.BLACK,
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(2),
              ),
              getBodyText(
                text: "Tashkent, Uzbekistan",
                fontSize: SizeConfig.calculateTextSize(12),
                fontWeight: FontWeight.w400,
                textColor: AppColors.BUTTON_BLUE,
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(8),
              ),
              getBodyText(
                text: data.category!.description ??
                    "Let’s have fun while creating awesome products #memes #inspiration #2022 #Design",
                fontSize: SizeConfig.calculateTextSize(14),
                fontWeight: FontWeight.w400,
                textColor: AppColors.BLACK,
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        Expanded(
          child: DefaultTabController(
            length: 3,
            initialIndex: 1,
            child: Column(
              children: [
                getTabBar(),
                Expanded(
                  child: getTabViews(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getBodyText({
    required String text,
    required double fontSize,
    required Color textColor,
    required fontWeight,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }

  getTabBar() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.BLACK, width: 0.1),
        ),
      ),
      child: TabBar(
        // indicator: UnderlineTabIndicator(
        //   borderSide: BorderSide(width: 5.0),
        //   insets: EdgeInsets.symmetric(horizontal:96.0)
        // ),

        labelStyle: TextStyle(
          fontSize: SizeConfig.calculateTextSize(16),
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: SizeConfig.calculateTextSize(16),
          fontWeight: FontWeight.w400,
        ),
        labelColor: AppColors.BUTTON_BLUE,
        unselectedLabelColor: AppColors.SHADOW_BLUE,
        isScrollable: false,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          getTab("Posts"),
          getTab("Shop"),
          getTab("About"),
        ],
      ),
    );
  }

  getTab(String text) {
    return Tab(
      text: text,
    );
  }

  getTabViews() {
    return TabBarView(
      children: [
        getPostsPage(),
        getShopPage(),
        getAboutPage(),
      ],
    );
  }

  getPostsPage() {
    return GetBuilder(
        id: _controllerOffers.offersId,
        init: _controllerOffers,
        builder: (context) {
          final gridList = _controllerOffers.offersList;
          final horizontalList = _controllerOffers.offersList;
          Get.log("OfferDetails data ${_controllerOffers.offersList}");
          return Column(
            children: [
              Expanded(
                child: SmartRefresher(
                  controller: _controllerOffers.offersController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onLoading: () {
                    _controllerOffers.loadingOffers();
                  },
                  onRefresh: () {
                    _controllerOffers.refreshOffers();
                  },
                  child: _controllerOffers.sortType == Sorting.sortBy
                      ?
                      //grid Data
                      buildGridItems(gridList)
                      // horizontal data
                      : buildHorizontalItems(horizontalList),
                ),
              ),
            ],
          );
        });
  }

  Widget buildGridItems(List<OfferModel> gridList) {
    return gridList.isNotEmpty
        ? GridView.builder(
            itemCount: gridList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: SizeConfig.calculateBlockHorizontal(167) /
                  SizeConfig.calculateBlockVertical(267),
            ),
            itemBuilder: (ctx, index) {
              return GestureDetector(
                  onTap: () {},
                  child: getGridItem(
                    gridList[index].name ?? 'no name',
                    gridList[index].cost ?? 0,
                    gridList[index],
                    gridList[index].image,
                  ));
            })
        // when gridList is empty
        : // here
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.PLACE_HOLDER,
                fit: BoxFit.contain,
                width: SizeConfig.calculateBlockVertical(160),
                height: SizeConfig.calculateBlockHorizontal(160),
              ),
            ),
          );
  }

  Widget buildHorizontalItems(List<OfferModel> horizontalList) {
    return horizontalList.isNotEmpty
        ? ListView.builder(
            itemBuilder: (ctx, index) {
              return getHorListItem(horizontalList[index].image,
                  horizontalList[index].name, 1, horizontalList[index]);
            },
            itemCount: horizontalList.length,
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child:
                  SvgPicture.asset(AppIcons.PLACE_HOLDER, fit: BoxFit.contain),
            ),
          );
  }

  getHorListItem(
      String? image, String? name, int? cost, OfferModel horizontalList) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.calculateBlockHorizontal(16),
        top: SizeConfig.calculateBlockVertical(16),
        right: SizeConfig.calculateBlockHorizontal(16),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.ITEM_DETAILS_PAGE);
        },
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(158),
              child: Row(
                children: [
                  image == null
                      ? SvgPicture.asset(AppIcons.PLACE_HOLDER,
                          fit: BoxFit.contain)
                      : Image.network(
                          image,
                          width: SizeConfig.calculateBlockHorizontal(117),
                          height: SizeConfig.calculateBlockVertical(158),
                        ),
                  SizedBox(
                    width: SizeConfig.calculateBlockHorizontal(12),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            name ?? "- - - -",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: SizeConfig.calculateTextSize(14),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.calculateBlockVertical(9),
                        ),
                        Row(
                          children: [
                            horizontalList.org!.logo != null
                                ? Image.network(
                                    horizontalList.org!.logo!,
                                    width:
                                        SizeConfig.calculateBlockHorizontal(16),
                                    height:
                                        SizeConfig.calculateBlockVertical(16),
                                  )
                                : Image.asset(
                                    AppImages.PLACE_HOLDER,
                                    width:
                                        SizeConfig.calculateBlockHorizontal(16),
                                    height:
                                        SizeConfig.calculateBlockVertical(16),
                                  ),
                            SizedBox(
                              width: SizeConfig.calculateBlockHorizontal(8),
                            ),
                            horizontalList.org!.name != null
                                ? Text('${horizontalList.org!.name}')
                                : Text(
                                    "- - - -",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.calculateTextSize(12),
                                        fontWeight: FontWeight.w400),
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.calculateBlockVertical(9),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.MAGISTR,
                              width: SizeConfig.calculateBlockHorizontal(13.94),
                              height: SizeConfig.calculateBlockVertical(11.63),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.calculateBlockHorizontal(4.67),
                                right:
                                    SizeConfig.calculateBlockHorizontal(12.67),
                              ),
                              child: Text(
                                "55",
                                style: TextStyle(
                                  fontSize: SizeConfig.calculateTextSize(10),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.ROYAL_ORANGE,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              AppIcons.ORDEN,
                              width: SizeConfig.calculateBlockHorizontal(6.67),
                              height: SizeConfig.calculateBlockVertical(12.98),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.calculateBlockHorizontal(8.67),
                                right:
                                    SizeConfig.calculateBlockHorizontal(8.51),
                              ),
                              child: Text(
                                "12",
                                style: TextStyle(
                                  fontSize: SizeConfig.calculateTextSize(10),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.VIOLET_BLUE,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              AppIcons.SHAKE_HAND,
                              width: SizeConfig.calculateBlockHorizontal(14.92),
                              height: SizeConfig.calculateBlockVertical(9.74),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.calculateBlockHorizontal(4.57),
                              ),
                              child: Text(
                                "45",
                                style: TextStyle(
                                  fontSize: SizeConfig.calculateTextSize(10),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.ROYAL_ORANGE,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.calculateBlockVertical(8),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.LOCATION,
                              width: SizeConfig.calculateBlockHorizontal(16),
                              height: SizeConfig.calculateBlockVertical(16),
                            ),
                            SizedBox(
                              width: SizeConfig.calculateBlockHorizontal(4),
                            ),
                            Text(
                              "Toshkentdan 18 km",
                              style: TextStyle(
                                  fontSize: SizeConfig.calculateTextSize(12),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.calculateBlockVertical(8),
                        ),
                        Text(
                          horizontalList.category!.name ?? '- - - -',
                          style: TextStyle(
                              fontSize: SizeConfig.calculateTextSize(12),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: SizeConfig.calculateBlockVertical(8),
                        ),
                        Row(
                          children: [
                            Text(
                              horizontalList.discount != null
                                  ? '${horizontalList.cost! * horizontalList.discount! / 100} UZS'
                                  : '${horizontalList.cost} UZS',
                              style: TextStyle(
                                  fontSize: SizeConfig.calculateTextSize(14),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: SizeConfig.calculateBlockHorizontal(8),
                            ),
                          ],
                        ),
                        horizontalList.discount != null
                            ? Text(
                                horizontalList.cost == null
                                    ? '0 UZS'
                                    : '${horizontalList.cost} UZS',
                                style: TextStyle(
                                  fontSize: SizeConfig.calculateTextSize(14),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.SUNSET_ORANGE,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getShopPage() {
    return GetBuilder(
        init: _controllerOffers,
        id: _controllerOffers.offersCatId,
        builder: (context) {
          return SmartRefresher(
            controller: _controllerOffers.offersCatController,
            enablePullDown: true,
            enablePullUp: true,
            onLoading: () {
              _controllerOffers.loadingOffersCat();
            },
            onRefresh: () {
              _controllerOffers.refreshOffersCat();
            },
            child: ListView.builder(
                itemCount: _controllerOffers.offersCatList.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = _controllerOffers.offersCatList[index];
                  Get.log("OffersPage list=> ${data.id}");

                  return InkWell(
                    onTap: () {
                      //_controllerOffers.itemClicked(data);
                    },
                    child: Column(
                      children: [
                        ListTile(
                          leading: SizedBox(
                            width: SizeConfig.calculateBlockHorizontal(56),
                            height: SizeConfig.calculateBlockVertical(56),
                            child: data.image != null
                                ? SvgPicture.string(
                                    data.image!,
                                    fit: BoxFit.contain,
                                  )
                                : SvgPicture.asset(
                                    AppIcons.PLACE_HOLDER,
                                    fit: BoxFit.contain,
                                  ),
                          ),
                          title: Text(
                            data.name != null ? data.name! : "- - - -",
                            style: TextStyle(
                              color: AppColors.BLACK,
                              fontSize: SizeConfig.calculateTextSize(16),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            data.id != null
                                ? "${data.id!} products"
                                : "- - - -",
                            style: TextStyle(
                              color: AppColors.SHADOW_BLUE,
                              fontSize: SizeConfig.calculateTextSize(12),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Divider(
                          indent: SizeConfig.calculateBlockHorizontal(88),
                          height: SizeConfig.calculateBlockVertical(8),
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }

  getGridItem(
    String title,
    int price,
    OfferModel data,
    String? image,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.calculateBlockHorizontal(4.5),
        top: SizeConfig.calculateBlockVertical(16),
        right: SizeConfig.calculateBlockHorizontal(4.5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: SizeConfig.calculateBlockHorizontal(16),
              ),
              Stack(
                children: [
                  SizedBox(
                    width: SizeConfig.calculateBlockHorizontal(167),
                    height: SizeConfig.calculateBlockVertical(180),
                    child: Expanded(
                      child: image == null
                          ? SvgPicture.asset(AppIcons.PLACE_HOLDER,
                              fit: BoxFit.contain)
                          : Image.network(image),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(12),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.calculateBlockVertical(12),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(12),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calculateBlockVertical(8),
                ),
                Text(
                  "${price.toString()} UZS",
                  style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(14),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                data.discount != null
                    ? Text(
                        '${data.discount}',
                        style: const TextStyle(color: Colors.redAccent),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }

  // getGridItem([String? text, Widget? prices]) {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //       left: SizeConfig.calculateBlockHorizontal(4.5),
  //       top: SizeConfig.calculateBlockVertical(16),
  //       right: SizeConfig.calculateBlockHorizontal(4.5),
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           children: [
  //             SizedBox(
  //               width: SizeConfig.calculateBlockHorizontal(16),
  //             ),
  //             Stack(
  //               children: [
  //                 Image.asset(
  //                   AppImages.IPHONE_13,
  //                   width: SizeConfig.calculateBlockHorizontal(167),
  //                   height: SizeConfig.calculateBlockVertical(180),
  //                 ),
  //                 prices ?? const SizedBox(),
  //               ],
  //             ),
  //           ],
  //         ),
  //         SizedBox(
  //           height: SizeConfig.calculateBlockVertical(12),
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Smartphone iPhone 12 Pro\n128GB Graphite",
  //               style: TextStyle(
  //                 fontSize: SizeConfig.calculateTextSize(12),
  //                 fontWeight: FontWeight.w400,
  //               ),
  //             ),
  //             SizedBox(
  //               height: SizeConfig.calculateBlockVertical(8),
  //             ),
  //             Text(
  //               "11 124 000 UZS",
  //               style: TextStyle(
  //                 fontSize: SizeConfig.calculateTextSize(14),
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //             Text(
  //               text ?? "",
  //               style: TextStyle(
  //                 fontSize: SizeConfig.calculateTextSize(12),
  //                 fontWeight: FontWeight.w400,
  //                 color: AppColors.SUNSET_ORANGE,
  //                 decoration: TextDecoration.lineThrough,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  getPrice() {
    return Positioned(
      left: SizeConfig.calculateBlockHorizontal(8),
      top: SizeConfig.calculateBlockVertical(8),
      child: Row(
        children: [
          getPriceContainer(
            "15%",
            AppColors.SUNSET_ORANGE,
          ),
          getPriceContainer(
            "20%",
            AppColors.ROYAL_ORANGE,
          ),
          getPriceContainer(
            "5%",
            AppColors.ROYAL_ORANGE,
          ),
        ],
      ),
    );
  }

  getPriceContainer(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.calculateBlockHorizontal(2),
      ),
      child: Container(
        width: SizeConfig.calculateBlockHorizontal(37),
        height: SizeConfig.calculateBlockVertical(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(10),
              fontWeight: FontWeight.w400,
              color: AppColors.WHITE,
            ),
          ),
        ),
      ),
    );
  }

  getAboutPage() {
    return const SizedBox();
  }
}
