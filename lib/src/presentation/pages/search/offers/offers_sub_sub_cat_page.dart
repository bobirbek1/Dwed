// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/offers/offers_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OffersSubSubCatPage extends StatelessWidget {
  OffersSubSubCatPage({Key? key}) : super(key: key);
  final argument = Get.arguments;
  final _controllerOffers = Get.find<OffersController>();

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
        argument.toString(),
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

  getOutlinedButton() {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.calculateBlockHorizontal(16),
      ),
      child: OutlinedButton(
        onPressed: () {},
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.calculateBlockVertical(45),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                "Show all offers akhror",
                style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(14),
                  fontWeight: FontWeight.w400,
                  color: AppColors.BUTTON_BLUE,
                ),
              ),
            ),
          ),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.calculateBlockHorizontal(100),
            ),
          ),
          side: const BorderSide(color: AppColors.BUTTON_BLUE),
        ),
      ),
    );
  }

  getItems() {
    return Column(
      children: [
        getOutlinedButton(),
        Expanded(
          child: GetBuilder(
              init: _controllerOffers,
              id: _controllerOffers.offersSubSubCatId,
              builder: (context) {
                return SmartRefresher(
                  controller: _controllerOffers.offersSubSubCatController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: () {
                    _controllerOffers.refreshOffersSubSubCat();
                  },
                  onLoading: () {
                    _controllerOffers.loadingOffersSubSubCat();
                  },
                  child: ListView.builder(
                      itemCount: _controllerOffers.offersSubSubCatList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data =
                            _controllerOffers.offersSubSubCatList[index];
                        return InkWell(
                          onTap: () {
                            _controllerOffers.itemClickedInSubSubPage(data);
                          },
                          child: Column(
                            children: [
                              ListTile(
                                leading: SizedBox(
                                  width:
                                      SizeConfig.calculateBlockHorizontal(56),
                                  height: SizeConfig.calculateBlockVertical(56),
                                  child: data.image != null
                                      ? SvgPicture.string(
                                          data.image!,
                                          fit: BoxFit.contain,
                                        )
                                      : SvgPicture.asset(AppIcons.PLACE_HOLDER,
                                          fit: BoxFit.contain),
                                ),
                                title: Text(
                                  data.name != null ? data.name! : "----",
                                  style: TextStyle(
                                    color: AppColors.BLACK,
                                    fontSize: SizeConfig.calculateTextSize(16),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  data.id != null
                                      ? "${data.id!} products"
                                      : "----",
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
              }),
        ),
      ],
    );
  }

  List<String> phonePageItemsIcons = [
    AppImages.STREAM_IPHONE,
    AppImages.PHONES_TABLETS,
    AppImages.PHONES_ACCESSORIES,
    AppImages.PHONES_SMARTWATCHES,
    AppImages.PHONES_BUTTONED,
    AppImages.PHONES_PHONES,
  ];
  List<String> phonePageItemsTitles = [
    "Smartphones",
    "Tablets",
    "Accessories",
    "Smartwatches",
    "Buttoned phones",
    "Phones",
  ];
  List<String> phonePageItemsSubtitles = [
    "1200 products",
    "1200 products",
    "1200 products",
    "1200 products",
    "1200 products",
    "1200 products",
  ];
}
