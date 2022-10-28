import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';

import 'package:get/get.dart';

class UserPostPage extends StatelessWidget {
  UserPostPage({Key? key}) : super(key: key);
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
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: SizeConfig.calculateBlockVertical(144),
          child: Stack(
            children: [
              Image.asset(
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
                      child: Image.asset(
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
                    text: "MEDION",
                    fontSize: SizeConfig.calculateTextSize(18),
                    textColor: AppColors.BLACK,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: SizeConfig.calculateBlockHorizontal(6),
                  ),
                  SvgPicture.asset(
                    AppIcons.LEGAL,
                    width: SizeConfig.calculateBlockHorizontal(20),
                    height: SizeConfig.calculateBlockVertical(20),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(6),
              ),
              getBodyText(
                text: "Project Owner at Akfa Group",
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
                text:
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
    return const SizedBox();
  }

  getShopPage() {
    return GridView.count(
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

  getAboutPage() {
    return const SizedBox();
  }
}
