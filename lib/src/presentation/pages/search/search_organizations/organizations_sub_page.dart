import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

class OrganizationsSubPage extends StatelessWidget {
  OrganizationsSubPage({Key? key}) : super(key: key);
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
                "Show all organizations",
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
          child: ListView.builder(
              itemCount: phonePageItemsIcons.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.ORGANIZATIONS_SUB_DETAILS_PAGE,
                      arguments: phonePageItemsTitles[index],
                    );
                  },
                  child: Column(
                    children: [
                      ListTile(
                        leading: SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(56),
                          height: SizeConfig.calculateBlockVertical(56),
                          child: Image.asset(phonePageItemsIcons[index]),
                        ),
                        title: Text(
                          phonePageItemsTitles[index],
                          style: TextStyle(
                            color: AppColors.BLACK,
                            fontSize: SizeConfig.calculateTextSize(16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          phonePageItemsSubtitles[index],
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
        ),
      ],
    );
  }

  List<String> phonePageItemsIcons = [
    AppImages.ORG_AMBULANCE_,
    AppImages.ORG_AUTO,
    // AppImages.ANHOR,
  ];
  List<String> phonePageItemsTitles = [
    "Davlat tibbiyot markazi",
    "Medical Clinic Neo"
    // "Turizm"
  ];
  List<String> phonePageItemsSubtitles = [
    "34 organizations",
    "34 organizations",
    // "34 organizations",
  ];
}
