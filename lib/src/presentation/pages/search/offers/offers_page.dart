import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/data/model/offers/offer_model.dart';
import 'package:flutter_template/src/presentation/controller/offers/offers_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OffersPage extends StatefulWidget {
  OffersPage({Key? key}) : super(key: key);
  final _controller = Get.find<OffersController>();

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  final title = Get.arguments;
  bool isVertical = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: getAppBar(),
      body: getItems(),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: AppColors.WHITE,
      elevation: 0.3,
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
      actions: [
        InkWell(
          child: Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.calculateBlockHorizontal(19),
            ),
            child: SvgPicture.asset(AppIcons.SEARCH_NORMAL),
          ),
        ),
      ],
    );
  }

  getSortFilter() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.calculateBlockHorizontal(16),
            vertical: SizeConfig.calculateBlockVertical(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                // There'll be a bottomsheet
                onTap: () {
                  widget._controller.updateItemType(Sorting.sortBy);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.calculateBlockVertical(5),
                    right: SizeConfig.calculateBlockVertical(12),
                    bottom: SizeConfig.calculateBlockVertical(5),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.SORT,
                        width: SizeConfig.calculateBlockHorizontal(16),
                        height: SizeConfig.calculateBlockVertical(16),
                      ),
                      SizedBox(
                        width: SizeConfig.calculateBlockHorizontal(8),
                      ),
                      Text(
                        "SORT BY",
                        style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(14),
                          fontWeight: FontWeight.w400,
                          color: AppColors.BLACK,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              InkWell(
                // There'll be a bottomsheet
                onTap: () {
                  widget._controller.updateItemType(Sorting.filter);
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.calculateBlockVertical(5),
                        right: SizeConfig.calculateBlockVertical(12),
                        bottom: SizeConfig.calculateBlockVertical(5),
                      ),
                      child: SvgPicture.asset(
                        AppIcons.FILTER,
                        width: SizeConfig.calculateBlockHorizontal(16),
                        height: SizeConfig.calculateBlockVertical(16),
                      ),
                    ),
                    Text(
                      "FILTER",
                      style: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(14),
                        fontWeight: FontWeight.w400,
                        color: AppColors.BLACK,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              InkWell(
                  onTap: () {
                    setState(
                      () {
                        isVertical ? (isVertical = false) : (isVertical = true);
                      },
                    );
                  },
                  child: isVertical
                      ? SvgPicture.asset(
                          AppIcons.ITEMS_HOR,
                          width: SizeConfig.calculateBlockHorizontal(16),
                          height: SizeConfig.calculateBlockVertical(16),
                        )
                      : SvgPicture.asset(
                          AppIcons.ITEMS_VER,
                          width: SizeConfig.calculateBlockHorizontal(16),
                          height: SizeConfig.calculateBlockVertical(16),
                        )),
              SizedBox(
                width: SizeConfig.calculateBlockHorizontal(8),
              ),
            ],
          ),
        ),
        Divider(
          height: SizeConfig.calculateBlockVertical(1),
          color: AppColors.BLACK.withOpacity(0.1),
        ),
      ],
    );
  }

  getItems() {
    return GetBuilder(
        id: widget._controller.offersId,
        init: widget._controller,
        builder: (context) {
          final gridList = widget._controller.offersList;
          final horizontalList = widget._controller.offersList;
          Get.log("OfferDetails data ${widget._controller.offersList}");
          return Column(
            children: [
              getSortFilter(),
              Expanded(
                child: SmartRefresher(
                  controller: widget._controller.offersController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onLoading: () {
                    widget._controller.loadingOffers();
                  },
                  onRefresh: () {
                    widget._controller.refreshOffers();
                  },
                  child: widget._controller.sortType == Sorting.sortBy
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
              child:
                  SvgPicture.asset(AppIcons.PLACE_HOLDER, fit: BoxFit.contain),
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

  getGridItem(
    String title,
    int price,
    OfferModel data,
    String? image,
  ) {
    int index = 0;
    for (var i = 0; i < getGridImages.length - 1; i++) {
      index = index + 1;
    }
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.calculateBlockHorizontal(4.5),
        top: SizeConfig.calculateBlockVertical(16),
        right: SizeConfig.calculateBlockHorizontal(4.5),
      ),
      child: InkWell(
        onTap: () {
          widget._controller.onItemClickedDetailsPage(data);
        },
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
      ),
    );
  }

  List<String> getGridImages = [
    AppImages.IPHONE_13,
    AppImages.DACHA,
    AppImages.DACHA,
    AppImages.IPHONE_13,
    AppImages.DACHA,
    AppImages.IPHONE_13,
  ];
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
          widget._controller.onItemClickedDetailsPage(horizontalList);
          // Get.toNamed(AppRoutes.ITEM_DETAILS_PAGE);
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
}
