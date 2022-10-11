import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        backgroundColor: AppColors.WHITE,
        elevation: 0.3,
        leading: Row(
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
        leadingWidth: 100,
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
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.calculateBlockVertical(20),
            ),
            getTabBar(),
            Expanded(
              child: getTabViews(),
            ),
          ],
        ),
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
        labelStyle: TextStyle(
          fontSize: SizeConfig.calculateTextSize(16),
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: SizeConfig.calculateTextSize(16),
          fontWeight: FontWeight.w400,
        ),
        labelColor: AppColors.BUTTON_BLUE,
        unselectedLabelColor: AppColors.BLACK,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          getTab("Offers"),
          getTab("Organizations"),
          getTab("Streams"),
          getTab("People"),
        ],
      ),
    );
  }

  getTabViews() {
    return TabBarView(children: [
      getOffersPage(),
      getOrganizationsPage(),
      getStreamsPage(),
      getPeoplePage(),
    ]);
  }

  getTab(String text) {
    return Tab(
      text: text,
    );
  }

  getOffersPage() {
    return ListView.builder(
        itemCount: offerPageItemsIcons.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.OFFERS_SUB_PAGE,
                  arguments: offerPageItemsTitles[index]);
            },
            child: Column(
              children: [
                ListTile(
                  leading: SizedBox(
                    width: SizeConfig.calculateBlockHorizontal(56),
                    height: SizeConfig.calculateBlockVertical(56),
                    child: Image.asset(offerPageItemsIcons[index]),
                  ),
                  title: Text(
                    offerPageItemsTitles[index],
                    style: TextStyle(
                      color: AppColors.BLACK,
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    offerPageItemsSubtitles[index],
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
        });
  }

  List<String> offerPageItemsIcons = [
    AppImages.OFFER_TIME,
    AppImages.OFFER_OB,
    AppImages.OFFER_M,
    AppImages.OFFER_OB,
    AppImages.OFFER_PAINT,
    AppImages.OFFER_PAINT,
    AppImages.OFFER_TIME,
    AppImages.OFFER_PAINT,
  ];
  List<String> offerPageItemsTitles = [
    "Phones, gadgets, accessories",
    "Men's Fashion",
    "TV, Applicanses, Electronics",
    "Beauty, Health, Grocery",
    "Gift Cards & Mobile Recharges",
    "Women's Fashion",
    "Parenting",
    "Businnes",
  ];
  List<String> offerPageItemsSubtitles = [
    "1200 products",
    "1200 products",
    "1200 products",
    "1200 products",
    "1200 products",
    "1200 products",
    "1200 products",
    "1200 products",
  ];
  getOrganizationsPage() {
    return ListView.builder(
        itemCount: organizationPageItemsIcons.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                AppRoutes.ORGANIZATIONS_SUB_PAGE,
                arguments: organizationPageItemsTitles[index],
              );
            },
            child: Column(
              children: [
                ListTile(
                  leading: SizedBox(
                    width: SizeConfig.calculateBlockHorizontal(56),
                    height: SizeConfig.calculateBlockVertical(56),
                    child: Image.asset(organizationPageItemsIcons[index]),
                  ),
                  title: Text(
                    organizationPageItemsTitles[index],
                    style: TextStyle(
                      color: AppColors.BLACK,
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    organizationPageItemsSubtitles[index],
                    style: TextStyle(
                      color: AppColors.GRAY_X11,
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
        });
  }

  List<String> organizationPageItemsIcons = [
    AppImages.ORG_AMBULANCE_,
    AppImages.ORG_IT,
    AppImages.ORG_DIGITAL,
    AppImages.ORG_AUTO,
    AppImages.ORG_GOVERNMENT,
    AppImages.ORG_EDUCATION,
  ];
  List<String> organizationPageItemsTitles = [
    "Davlat tibbiyot markazi",
    "IT",
    "Digital",
    "Auto",
    "Government",
    "Education",
  ];
  List<String> organizationPageItemsSubtitles = [
    "34 organizations",
    "34 organizations",
    "34 organizations",
    "34 organizations",
    "34 organizations",
    "34 organizations",
  ];
  getStreamsPage() {
    return ListView.builder(
        itemCount: streamPageItemsIcons.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                AppRoutes.STREAMS_SUB_PAGE,
                arguments: streamPageItemsTitles[index],
              );
            },
            child: Column(
              children: [
                ListTile(
                  leading: SizedBox(
                    width: SizeConfig.calculateBlockHorizontal(56),
                    height: SizeConfig.calculateBlockVertical(56),
                    child: Image.asset(streamPageItemsIcons[index]),
                  ),
                  title: Text(
                    streamPageItemsTitles[index],
                    style: TextStyle(
                      color: AppColors.BLACK,
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    streamPageItemsSubtitles[index],
                    style: TextStyle(
                      color: AppColors.GRAY_X11,
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
        });
  }

  List<String> streamPageItemsIcons = [
    AppImages.STREAM_IPHONE,
    AppImages.STREAM_IPHONE,
    AppImages.STREAM_IPHONE,
    AppImages.STREAM_IPHONE,
    AppImages.STREAM_IPHONE,
    AppImages.STREAM_IPHONE,
    AppImages.STREAM_IPHONE,
  ];
  List<String> streamPageItemsTitles = [
    "Education",
    "Games",
    "Cartoon",
    "Movies",
    "Shows",
    "Concert",
    "Phones, gadgets, accessories"
  ];
  List<String> streamPageItemsSubtitles = [
    "120 stream",
    "120 stream",
    "120 stream",
    "120 stream",
    "120 stream",
    "120 stream",
    "120 stream",
  ];
  getPeoplePage() {
    return ListView.builder(
        itemCount: peoplePageItemsIcons.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                AppRoutes.PEOPLE_SUB_PAGE,
                arguments: peoplePageItemsTitles[index],
              );
            },
            child: Column(
              children: [
                ListTile(
                  leading: SizedBox(
                    width: SizeConfig.calculateBlockHorizontal(56),
                    height: SizeConfig.calculateBlockVertical(56),
                    child: Image.asset(peoplePageItemsIcons[index]),
                  ),
                  title: Text(
                    peoplePageItemsTitles[index],
                    style: TextStyle(
                      color: AppColors.BLACK,
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    peoplePageItemsSubtitles[index],
                    style: TextStyle(
                      color: AppColors.GRAY_X11,
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
        });
  }

  List<String> peoplePageItemsIcons = [
    AppImages.ORG_AMBULANCE_,
    AppImages.ORG_IT,
    AppImages.ORG_DIGITAL,
    AppImages.ORG_AUTO,
    AppImages.ORG_GOVERNMENT,
    AppImages.ORG_EDUCATION,
    AppImages.ORG_AMBULANCE_,
  ];

  List<String> peoplePageItemsTitles = [
    "Doctors",
    "IT",
    "Managers",
    "Chef",
    "Seller",
    "Teacher",
    "Driver"
  ];
  List<String> peoplePageItemsSubtitles = [
    "12 588 people",
    "12 588 people",
    "12 588 people",
    "12 588 people",
    "12 588 people",
    "12 588 people",
    "12 588 people",
  ];
}
