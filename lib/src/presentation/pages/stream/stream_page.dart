import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

class StreamPage extends StatelessWidget {
  StreamPage({Key? key}) : super(key: key);

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
      leadingWidth: 120,
      leading: Row(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.calculateBlockHorizontal(16),
                  right: SizeConfig.calculateBlockHorizontal(6),
                ),
                child: SvgPicture.asset(AppIcons.SHAPE),
              ),
              SvgPicture.asset(
                AppIcons.DWED,
                height: SizeConfig.calculateBlockVertical(11),
              ),
            ],
          ),
        ],
      ),
      actions: [
        InkWell(
          child: Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.calculateBlockHorizontal(27),
            ),
            child: SvgPicture.asset(AppIcons.SEARCH_NORMAL),
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.calculateBlockHorizontal(18),
            ),
            child: SvgPicture.asset(
              AppIcons.FILTER_2,
              width: SizeConfig.calculateBlockHorizontal(17.2),
              height: SizeConfig.calculateBlockVertical(22.8),
              color: AppColors.BLACK,
            ),
          ),
        ),
      ],
    );
  }

  getHorListView() {
    return SizedBox(
      height: SizeConfig.calculateBlockVertical(63),
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.calculateBlockHorizontal(16),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: getHorListViewTitles.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                getHorListViewContainer(
                  getHorListViewTitles[index],
                  AppColors.SHADOW_BLUE,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<String> getHorListViewTitles = [
    "All",
    "Education",
    "Games",
    "Movies",
    "Movies",
    "Education",
    "Games",
  ];
  getItems() {
    return Column(
      children: [
        getHorListView(),
        Expanded(
          child: ListView.builder(
            itemCount: streamsImages.length,
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
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.STREAM_DETAILS_PAGE);
                            },
                            child: Image.asset(
                              streamsLive[index],
                              fit: BoxFit.fill,
                            ),
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
                          streamsImages[index],
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
                              streamsTitles[index],
                              style: TextStyle(
                                fontSize: SizeConfig.calculateTextSize(14),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.calculateBlockVertical(4),
                            ),
                            Text(
                              streamsSubtitles[index],
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
        SizedBox(
          height: SizeConfig.calculateBlockVertical(70),
        ),
      ],
    );
  }

  final List<String> streamsLive = [
    AppImages.SCREEN,
    AppImages.PLAYGROUND,
    AppImages.SCREEN,
  ];
  final List<String> streamsImages = [
    AppImages.MATH,
    AppImages.MATH_KIDS,
    AppImages.MATH,
  ];
  final List<String> streamsTitles = [
    "Math 1-lesson",
    "NASA ACADEMY",
    "Math 1-lesson",
  ];
  final List<String> streamsSubtitles = [
    "Math for kids",
    "MATH WARS",
    "Math for kids",
  ];
  getHorListViewContainer(String text, Color color) {
    return Padding(
      padding: EdgeInsets.only(
        right: SizeConfig.calculateBlockHorizontal(12),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: AppColors.SHADOW_BLUE,
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.calculateBlockVertical(8),
              horizontal: SizeConfig.calculateBlockHorizontal(16),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(14),
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }

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
