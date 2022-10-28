import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/offers/offers_controller.dart';
import 'package:get/get.dart';

class OffersSubDetailsPage extends StatefulWidget {
  OffersSubDetailsPage({Key? key}) : super(key: key);
  final _controller = Get.find<OffersController>();

  @override
  State<OffersSubDetailsPage> createState() => _OffersSubDetailsPageState();
}

class _OffersSubDetailsPageState extends State<OffersSubDetailsPage> {
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
                onTap: () {},
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
                onTap: () {},
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
        id: widget._controller.offersDetailsId,
        init: widget._controller,
        builder: (context) {
          Get.log("OfferDetails data ${widget._controller.offersDetailsList}");
          return Column(
            children: [
              getSortFilter(),
              Expanded(
                child: isVertical
                    ? GridView.builder(
                        itemCount: widget._controller.offersDetailsList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              SizeConfig.calculateBlockHorizontal(167) /
                                  SizeConfig.calculateBlockVertical(267),
                        ),
                        itemBuilder: (context, index) {
                          final data =
                              widget._controller.offersDetailsList[index];
                          return GestureDetector(
                              onTap: () {},
                              child: getGridItem(
                                  data.name != null
                                      ? widget._controller
                                          .offersDetailsList[index].name!
                                      : "----",
                                  data.cost != null
                                      ? widget._controller
                                          .offersDetailsList[index].cost!
                                      : 0,
                                  data.image));
                        })
                    : ListView.builder(
                        itemCount: widget._controller.offersDetailsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final data1 =
                              widget._controller.offersDetailsList[index];
                          return getHorListItem(
                              data1.image, data1.name, data1.cost);
                        },
                      ),
              ),
            ],
          );
        });
  }

  getGridItem(String title, int price,
      [String? image, String? text, Widget? prices]) {
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
                  Container(
                    width: SizeConfig.calculateBlockHorizontal(167),
                    height: SizeConfig.calculateBlockVertical(180),
                    child: Expanded(
                      child: image == null
                          ? Image.asset(
                              AppImages.IPHONE_13,
                              fit: BoxFit.contain,
                            )
                          : Image.network(image),
                    ),
                  ),
                  prices ?? const SizedBox(),
                ],
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(12),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                "${price.toString()} uzs",
                style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(14),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                text ?? "",
                style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(12),
                  fontWeight: FontWeight.w400,
                  color: AppColors.SUNSET_ORANGE,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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

  getHorListItem(String? image, String? name, int? cost) {
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
        child: Row(
          children: [
            image == null
                ? Image.asset(
                    AppImages.IPHONE_13,
                    fit: BoxFit.contain,
                    width: SizeConfig.calculateBlockHorizontal(117),
                    height: SizeConfig.calculateBlockVertical(158),
                  )
                : Image.network(
                    image,
                    width: SizeConfig.calculateBlockHorizontal(117),
                    height: SizeConfig.calculateBlockVertical(158),
                  ),
            SizedBox(
              width: SizeConfig.calculateBlockHorizontal(12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name == null ? "----" : name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(14),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: SizeConfig.calculateBlockVertical(9),
                ),
                Row(
                  children: [
                    Image.asset(
                      AppImages.ANHOR,
                      width: SizeConfig.calculateBlockHorizontal(16),
                      height: SizeConfig.calculateBlockVertical(16),
                    ),
                    SizedBox(
                      width: SizeConfig.calculateBlockHorizontal(8),
                    ),
                    Text(
                      "Anhor Relax Zone",
                      style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(12),
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
                        right: SizeConfig.calculateBlockHorizontal(12.67),
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
                        right: SizeConfig.calculateBlockHorizontal(8.51),
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
                  "Oilaviy kvartira",
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
                      cost != 0 ? cost.toString() : "0",
                      style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(14),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: SizeConfig.calculateBlockHorizontal(8),
                    ),
                    Text(
                      "12 599 000 UZS",
                      style: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(14),
                        fontWeight: FontWeight.w600,
                        color: AppColors.SUNSET_ORANGE,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(20),
            ),
          ],
        ),
      ),
    );
  }
}
