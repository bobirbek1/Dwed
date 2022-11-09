
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/Search/organisation_controller.dart';
import 'package:flutter_template/src/presentation/controller/offers/offers_controller.dart';
import 'package:flutter_template/src/presentation/pages/search/recent_searches_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_typing.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
  final _controllerOrganisation = Get.find<OrganisationController>();
  final _controllerOffers = Get.find<OffersController>();
}

class _SearchPageState extends State<SearchPage> {
  bool typing = true;
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: getAppBar(
        typing
            ? Row(
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
              )
            : Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.calculateBlockHorizontal(16),
                      right: SizeConfig.calculateBlockHorizontal(6),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Get.back();
                        setState(() {
                          controller.clear();
                          typing ? (typing = false) : (typing = true);
                        });
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
        typing
            ? const SizedBox()
            : TextField(
                controller: controller,
                cursorHeight: 24,
                onChanged: (val) {
                  setState(() {
                    controller.text;
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.SHADOW_BLUE,
                  ),
                ),
              ),
        typing
            ? SizeConfig.calculateBlockHorizontal(100)
            : SizeConfig.calculateBlockHorizontal(55),
      ),
      body: typing
          ? DefaultTabController(
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
                  SizedBox(height : SizeConfig.calculateBlockVertical(72))
                ],
              ),
            )
          : controller.text.isEmpty
              ? RecentSearchPage()
              : SearchTyping(),
    );
  }

  getAppBar(Widget leading, Widget title, double leadingWidth) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.3,
      leading: leading,
      leadingWidth: leadingWidth,
      title: title,
      actions: [
        typing
            ? InkWell(
                onTap: () {
                  setState(() {
                    typing ? (typing = false) : (typing = true);
                  });
                },
                child: Padding(
                    padding: EdgeInsets.only(
                      right: SizeConfig.calculateBlockHorizontal(19),
                    ),
                    child: SvgPicture.asset(AppIcons.SEARCH_NORMAL)),
              )
            : controller.text.isEmpty
                ? const SizedBox()
                : InkWell(
                    onTap: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: SizeConfig.calculateBlockHorizontal(19),
                      ),
                      child: SvgPicture.asset(AppIcons.CLOSE_SEARCHFIELD),
                    ),
                  ),
      ],
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
    return GetBuilder(
      init: widget._controllerOffers,
      id: widget._controllerOffers.offersId,
      builder: (context) {
        return SmartRefresher(
          controller: widget._controllerOffers.refreshControllerSearchPage,
          enablePullDown: true,
          enablePullUp: true,
          onLoading: (){
            widget._controllerOffers.onLoadingForSearchPage();
          },
          onRefresh: () {
            widget._controllerOffers.onRefreshForSearchPage();
          },
          child: ListView.builder(
              itemCount: widget._controllerOffers.offersList.length,
              itemBuilder: (BuildContext context, int index) {
                final data = widget._controllerOffers.offersList[index];
                Get.log("OffersPage list=> ${data.id}");

                return InkWell(
                  onTap: () {
                    widget._controllerOffers.itemClicked(data);
                  },
                  child: Column(
                    children: [
                      ListTile(
                        leading: SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(56),
                          height: SizeConfig.calculateBlockVertical(56),
                          child: data.image != null
                              ? SvgPicture.string(
                                  data.image!,
                                  fit: BoxFit.contain,
                                )
                              : SvgPicture.asset(AppIcons.PLACE_HOLDER, fit: BoxFit.contain,),
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
                          data.id != null ? "${data.id!} products" : "----",
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
      }
    );
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
    return GetBuilder(
      id: widget._controllerOrganisation.organisationId,
      init: widget._controllerOrganisation,
      builder: (context) {
        return SmartRefresher(
          controller: widget._controllerOrganisation.refreshControllerOrganisations,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: () {
            widget._controllerOrganisation.onRefreshForOrganisationPage();
          },
          onLoading: (){
            widget._controllerOrganisation.onLoadingForOrganisationPage();
          },
          child: ListView.builder(
              itemCount: widget._controllerOrganisation.organisationList.length,
              itemBuilder: (BuildContext context, int index) {
                final data = widget._controllerOrganisation.organisationList[index];
                Get.log("Organisation index=>$index");
                Get.log(
                    "Organisation ListAll=> ${widget._controllerOrganisation.organisationList}");
                Get.log("Organisation List => $data}");
                Get.log("Organisation item logo ${data.category!.image!}");
                // Get.log("Organisation item name ${ _controllerOrganisation.organisationList[index].name!}");
                // Get.log("Organisation item name ${_controllerOrganisation.organisationList[index].slugName!}");

                return InkWell(
                  onTap: () {
                    // Get.toNamed(
                    //   AppRoutes.ORGANIZATIONS_SUB_PAGE,
                    //   arguments: data.name!,
                    // );
                    widget._controllerOrganisation.onClickOrganisationItem(data);
                  },
                  child: Column(
                    children: [
                      ListTile(
                        leading: SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(56),
                          height: SizeConfig.calculateBlockVertical(56),
                          child: data.logo != null
                              ? Image.network(data.category!.image!)
                              : Image.asset(AppImages.PLAYGROUND),
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
                          data.subs!.me != null
                              ? "${data.subs!.me!} Organizations"
                              : "0 Organizations",
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
              }),
        );
      }
    );
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
