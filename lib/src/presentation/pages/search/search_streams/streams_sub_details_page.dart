import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

class StreamsSubDetailsPage extends StatelessWidget {
  StreamsSubDetailsPage({Key? key}) : super(key: key);
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
          child: ListView.builder(
            itemCount: streamsSubDetailsImages.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.calculateBlockHorizontal(16),
                  right: SizeConfig.calculateBlockHorizontal(16),
                  bottom: SizeConfig.calculateBlockVertical(12),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: double.infinity,
                          height: SizeConfig.calculateBlockVertical(196),
                          child: Image.asset(
                            streamsSubDetailsLive[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          left: SizeConfig.calculateBlockHorizontal(8),
                          top: SizeConfig.calculateBlockVertical(8),
                          child: Container(
                            width: SizeConfig.calculateBlockHorizontal(35),
                            height: SizeConfig.calculateBlockVertical(18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.SUNSET_ORANGE,
                            ),
                            child: Center(
                              child: Text(
                                "LIVE",
                                style: TextStyle(
                                  fontSize: SizeConfig.calculateTextSize(10),
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.WHITE,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: SizeConfig.calculateBlockVertical(8),
                          left: SizeConfig.calculateBlockHorizontal(8),
                          child: Container(
                            width: SizeConfig.calculateBlockHorizontal(88),
                            height: SizeConfig.calculateBlockVertical(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.SHADOW_BLUE.withOpacity(0.3),
                            ),
                            child: Center(
                              child: Text(
                                "10.5K Views",
                                style: TextStyle(
                                  fontSize: SizeConfig.calculateTextSize(10),
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.WHITE,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(12),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          streamsSubDetailsImages[index],
                          width: SizeConfig.calculateBlockHorizontal(48),
                          height: SizeConfig.calculateBlockVertical(48),
                        ),
                        SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(8),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              streamsSubDetailsTitles[index],
                              style: TextStyle(
                                fontSize: SizeConfig.calculateTextSize(14),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.calculateBlockVertical(4),
                            ),
                            Text(
                              streamsSubDetailsSubtitles[index],
                              style: TextStyle(
                                fontSize: SizeConfig.calculateTextSize(12),
                                fontWeight: FontWeight.w400,
                                color: AppColors.SHADOW_BLUE,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.calculateBlockVertical(8),
                            ),
                            Row(
                              children: [
                                getSmallContainer("Math"),
                                getSmallContainer("Beginner"),
                                getSmallContainer("Uzbek"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(4),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  final List<String> streamsSubDetailsLive = [
    AppImages.SCREEN,
    AppImages.PLAYGROUND,
    AppImages.SCREEN,
  ];
  final List<String> streamsSubDetailsImages = [
    AppImages.MATH,
    AppImages.MATH_KIDS,
    AppImages.MATH,
  ];
  final List<String> streamsSubDetailsTitles = [
    "Math 1-lesson",
    "NASA ACADEMY",
    "Math 1-lesson",
  ];
  final List<String> streamsSubDetailsSubtitles = [
    "Math for kids",
    "MATH WARS",
    "Math for kids",
  ];
  getSmallContainer(String text) {
    return Container(
      margin: EdgeInsets.only(
        right: SizeConfig.calculateBlockHorizontal(4),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.calculateBlockHorizontal(8),
        vertical: SizeConfig.calculateBlockVertical(4),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.ANTI_FLASH_WHITE,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: SizeConfig.calculateTextSize(10),
            fontWeight: FontWeight.w400,
            color: AppColors.SHADOW_BLUE,
          ),
        ),
      ),
    );
  }
}
