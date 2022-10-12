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
                    Row(
                      children: [
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
                    fontSize: 18,
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
                fontSize: 16,
                fontWeight: FontWeight.w400,
                textColor: AppColors.BLACK,
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(2),
              ),
              getBodyText(
                text: "Tashkent, Uzbekistan",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: AppColors.BUTTON_BLUE,
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(8),
              ),
              getBodyText(
                text:
                    "Let’s have fun while creating awesome products #memes #inspiration #2022 #Design",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: AppColors.BLACK,
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        Divider(
          thickness: SizeConfig.calculateBlockVertical(8),
          color: AppColors.DIVIDER,
        ),
        // DefaultTabController(
        //   length: 3,
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: SizeConfig.calculateBlockVertical(48),
        //       ),
        //       getTabBar(),
        //       Expanded(
        //         child: getTabViews(),
        //       ),
        //     ],
        //   ),
        // ),
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

  // getTabBar() {
  //   return Container(
  //     width: double.infinity,
  //     decoration: const BoxDecoration(
  //       border: Border(
  //         bottom: BorderSide(color: AppColors.BLACK, width: 0.1),
  //       ),
  //     ),
  //     child: TabBar(
  //       labelStyle: TextStyle(
  //         fontSize: SizeConfig.calculateTextSize(16),
  //         fontWeight: FontWeight.w400,
  //       ),
  //       unselectedLabelStyle: TextStyle(
  //         fontSize: SizeConfig.calculateTextSize(16),
  //         fontWeight: FontWeight.w400,
  //       ),
  //       labelColor: AppColors.BUTTON_BLUE,
  //       unselectedLabelColor: AppColors.SHADOW_BLUE,
  //       isScrollable: true,
  //       indicatorSize: TabBarIndicatorSize.label,
  //       tabs: [
  //         getTab("Posts"),
  //         getTab("Shop"),
  //         getTab("About"),
  //       ],
  //     ),
  //   );
  // }

  // getTab(String text) {
  //   return Tab(
  //     text: text,
  //   );
  // }

  // getTabViews() {
  //   return TabBarView(
  //     children: [
  //       getPostsPage(),
  //       getShopPage(),
  //       getAboutPage(),
  //     ],
  //   );
  // }

  // getPostsPage() {
  //   return Text("1",style: TextStyle(fontSize: 100),);
  // }

  // getShopPage() {
  //   return Text("2");
  // }

  // getAboutPage() {
  //   return Text("3");
  // }
}
