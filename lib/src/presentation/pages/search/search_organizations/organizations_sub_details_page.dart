import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

class OrganizationsSubDetailsPage extends StatelessWidget {
  OrganizationsSubDetailsPage({Key? key}) : super(key: key);
  final title = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getItems(),
      backgroundColor: AppColors.WHITE,
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
                onTap: () {},
                child: SvgPicture.asset(
                  AppIcons.ITEMS_HOR,
                  width: SizeConfig.calculateBlockHorizontal(16),
                  height: SizeConfig.calculateBlockVertical(16),
                ),
              ),
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
    return Column(
      children: [
        getSortFilter(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.calculateBlockHorizontal(16),
            ),
            child: ListView.builder(
                itemCount: orgSubDetailsImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      orgSubDetailsImages[index],
                      width: SizeConfig.calculateBlockHorizontal(56),
                      height: SizeConfig.calculateBlockVertical(56),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              orgSubDetailsTitles[index],
                              style: TextStyle(
                                fontSize: SizeConfig.calculateTextSize(16),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.calculateBlockHorizontal(4),
                            ),
                            SvgPicture.asset(
                              AppIcons.LEGAL,
                              width: SizeConfig.calculateBlockHorizontal(16),
                              height: SizeConfig.calculateBlockVertical(16),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Container(
                              width: SizeConfig.calculateBlockHorizontal(70),
                              height: SizeConfig.calculateBlockVertical(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.BUTTON_BLUE,
                              ),
                              child: Center(
                                child: Text(
                                  "Follow",
                                  style: TextStyle(
                                    fontSize: SizeConfig.calculateTextSize(12),
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.WHITE,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.calculateBlockVertical(4),
                        ),
                        Text(
                          orgSubDetailsSubtitles[index],
                          style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(14),
                            fontWeight: FontWeight.w300,
                            color: AppColors.SHADOW_BLUE,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.calculateBlockHorizontal(8.0),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.MAGISTR,
                                width:
                                    SizeConfig.calculateBlockHorizontal(13.94),
                                height:
                                    SizeConfig.calculateBlockVertical(11.63),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      SizeConfig.calculateBlockHorizontal(4.67),
                                  right: SizeConfig.calculateBlockHorizontal(
                                      12.67),
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
                                width:
                                    SizeConfig.calculateBlockHorizontal(6.67),
                                height:
                                    SizeConfig.calculateBlockVertical(12.98),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      SizeConfig.calculateBlockHorizontal(8.67),
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
                                width:
                                    SizeConfig.calculateBlockHorizontal(14.92),
                                height: SizeConfig.calculateBlockVertical(9.74),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      SizeConfig.calculateBlockHorizontal(4.57),
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
                        ),
                        Text(
                          orgSubDetailsDescriptions[index],
                          style: TextStyle(
                              fontSize: SizeConfig.calculateTextSize(12),
                              fontWeight: FontWeight.w400,
                              color: AppColors.BLACK),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: SizeConfig.calculateBlockVertical(12),
                            bottom: SizeConfig.calculateBlockVertical(8),
                          ),
                          child: Divider(
                            height: SizeConfig.calculateBlockVertical(1),
                            color: AppColors.BLACK.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  final List<String> orgSubDetailsImages = [
    AppImages.MEDION,
    AppImages.TEMIR_YOL,
    AppImages.COCA_COLA,
  ];
  final List<String> orgSubDetailsTitles = [
    "Medion",
    "Markaziy temir\nyo'l poliklinikasi",
    "Coca-Cola company",
  ];
  final List<String> orgSubDetailsSubtitles = [
    "Medical clinic",
    "Medical clinic",
    "Food and Beverage services",
  ];
  final List<String> orgSubDetailsDescriptions = [
    "5 лет заботимся о красоте и...",
    '''"O'zbekiston temir yo'llari" A...''',
    "The Coca-Cola Company (NYS...",
  ];
}
