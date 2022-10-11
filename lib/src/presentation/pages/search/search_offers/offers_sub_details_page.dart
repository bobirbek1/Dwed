import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

class OffersSubDetailsPage extends StatelessWidget {
  OffersSubDetailsPage({Key? key}) : super(key: key);
  final title = Get.arguments;
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
        Row(
          children: [
            InkWell(
              // There'll be a bottomsheet
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.calculateBlockHorizontal(17),
                  left: SizeConfig.calculateBlockHorizontal(16),
                  right: SizeConfig.calculateBlockHorizontal(81),
                  bottom: SizeConfig.calculateBlockHorizontal(17),
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
            SizedBox(
              width: SizeConfig.calculateBlockHorizontal(20),
            ),
            InkWell(
              // There'll be a bottomsheet
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.calculateBlockVertical(17),
                  right: SizeConfig.calculateBlockHorizontal(100),
                  bottom: SizeConfig.calculateBlockVertical(17),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.FILTER,
                      width: SizeConfig.calculateBlockHorizontal(16),
                      height: SizeConfig.calculateBlockVertical(16),
                    ),
                    SizedBox(
                      width: SizeConfig.calculateBlockHorizontal(8),
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
            ),
          ],
        ),
        Divider(
          height: SizeConfig.calculateBlockVertical(1),
          color: AppColors.BLACK.withOpacity(0.1),
        ),
      ],
    );
  }

  getItems() {
    return Column(
      children: [
        getSortFilter(),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: SizeConfig.calculateBlockHorizontal(167) /
                SizeConfig.calculateBlockVertical(267),
            children: [
              getGridItem(
                "12 599 000 UZS",
                getPrice(),
              ),
              getGridItem(),
              getGridItem(),
              getGridItem(
                "12 599 000 UZS",
                getPrice(),
              ),
              getGridItem(),
              getGridItem(
                "12 599 000 UZS",
                getPrice(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getGridItem([String? text, Widget? prices]) {
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
                  Image.asset(
                    AppImages.IPHONE_13,
                    width: SizeConfig.calculateBlockHorizontal(167),
                    height: SizeConfig.calculateBlockVertical(180),
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
                "Smartphone iPhone 12 Pro\n128GB Graphite",
                style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(12),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(8),
              ),
              Text(
                "11 124 000 UZS",
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
}
