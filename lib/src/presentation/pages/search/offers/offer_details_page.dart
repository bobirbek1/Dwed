import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/data/model/offers/offer_details_model.dart';
import 'package:flutter_template/src/presentation/controller/offers/offers_controller.dart';
import 'package:flutter_template/src/presentation/widgets/indicator.dart';
import 'package:get/get.dart';

class OfferDetailsPage extends StatelessWidget {
  final PageController _controller = PageController();
  final _controllerOffers = Get.find<OffersController>();

  OfferDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: buildAppBar(),
      body: GetBuilder(
        init: _controllerOffers,
        id: _controllerOffers.offerDetailsId,
        builder: (GetxController controller) {
          final data = _controllerOffers.offerDetails;
          return _controllerOffers.offersState == OffersState.error
              ? const Center(
                  child: Text('Error'),
                )
              : _controllerOffers.offersState == OffersState.loading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeader(),
                          Padding(
                            padding: EdgeInsets.all(
                              SizeConfig.calculateBlockHorizontal(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...buildDetails(),
                                SizedBox(
                                  height: SizeConfig.calculateBlockVertical(16),
                                ),
                                if (data.responsible?.isNotEmpty == true)
                                  ...buildSpecialists(),
                                if (data.responsible?.isNotEmpty == true)
                                  SizedBox(
                                    height:
                                        SizeConfig.calculateBlockVertical(24),
                                  ),
                                getOutlinedButton(
                                  () {},
                                  "Savatga qo'shish",
                                  AppColors.WHITE,
                                  AppColors.BUTTON_BLUE,
                                  AppColors.BUTTON_BLUE,
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.BAG,
                                        width:
                                            SizeConfig.calculateBlockHorizontal(
                                                24),
                                        height:
                                            SizeConfig.calculateBlockVertical(
                                                24),
                                        color: AppColors.BUTTON_BLUE,
                                      ),
                                      SizedBox(
                                        width:
                                            SizeConfig.calculateBlockHorizontal(
                                                8),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.calculateBlockVertical(12),
                                ),
                                getOutlinedButton(
                                  () {},
                                  "Bo'lib to'lash",
                                  AppColors.ROYAL_ORANGE,
                                  AppColors.WHITE,
                                  AppColors.WHITE,
                                  const SizedBox(),
                                ),
                                SizedBox(
                                  height: SizeConfig.calculateBlockVertical(12),
                                ),
                                getOutlinedButton(
                                  () {
                                    Get.toNamed(AppRoutes.CARTPAGE);
                                  },
                                  "Hoziroq rasmiylashtirish",
                                  AppColors.BUTTON_BLUE,
                                  AppColors.WHITE,
                                  AppColors.WHITE,
                                  const SizedBox(),
                                ),
                                SizedBox(
                                  height: SizeConfig.calculateBlockVertical(24),
                                ),
                                ...buildDescription(),
                                SizedBox(
                                  height: SizeConfig.calculateBlockVertical(16),
                                ),
                                getText(
                                  text: "Specifications",
                                  fontSize: SizeConfig.calculateTextSize(16),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.BLACK,
                                ),
                                SizedBox( 
                                  height: SizeConfig.calculateBlockVertical(12),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    getText(
                                      text: "Ajratish turi",
                                      fontSize:
                                          SizeConfig.calculateTextSize(14),
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.BLACK,
                                    ),
                                    getText(
                                      text: "Oilaviy kvartira",
                                      fontSize:
                                          SizeConfig.calculateTextSize(14),
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.BLACK,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.calculateBlockVertical(8),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    getText(
                                      text: "Odamlar soni",
                                      fontSize:
                                          SizeConfig.calculateTextSize(14),
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.BLACK,
                                    ),
                                    getText(
                                      text: "13",
                                      fontSize:
                                          SizeConfig.calculateTextSize(14),
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.BLACK,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.calculateBlockVertical(8),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    getText(
                                      text: "Texnika",
                                      fontSize:
                                          SizeConfig.calculateTextSize(14),
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.BLACK,
                                    ),
                                    getText(
                                      text: "Wi-Fi, Televizor",
                                      fontSize:
                                          SizeConfig.calculateTextSize(14),
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.BLACK,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.calculateBlockVertical(40),
                                ),
                                getText(
                                  text: "Selling organization",
                                  fontSize: SizeConfig.calculateTextSize(16),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.BLACK,
                                ),
                                ListTile(
                                  leading: Image.asset(
                                    AppImages.ANHOR_4,
                                    width:
                                        SizeConfig.calculateBlockHorizontal(48),
                                    height:
                                        SizeConfig.calculateBlockVertical(48),
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      getText(
                                        text: "Anhor Relax Zone",
                                        fontSize:
                                            SizeConfig.calculateTextSize(16),
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.BLACK,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.CALL_CALLING,
                                            width: SizeConfig
                                                .calculateBlockHorizontal(24),
                                            height: SizeConfig
                                                .calculateBlockVertical(24),
                                          ),
                                          SizedBox(
                                            width: SizeConfig
                                                .calculateBlockHorizontal(16),
                                          ),
                                          SvgPicture.asset(
                                            AppIcons.MESSENGER,
                                            width: SizeConfig
                                                .calculateBlockHorizontal(24),
                                            height: SizeConfig
                                                .calculateBlockVertical(24),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.MAGISTR,
                                        width:
                                            SizeConfig.calculateBlockHorizontal(
                                                13.94),
                                        height:
                                            SizeConfig.calculateBlockVertical(
                                                11.63),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: SizeConfig
                                              .calculateBlockHorizontal(4.67),
                                          right: SizeConfig
                                              .calculateBlockHorizontal(12.67),
                                        ),
                                        child: Text(
                                          "55",
                                          style: TextStyle(
                                            fontSize:
                                                SizeConfig.calculateTextSize(
                                                    10),
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.ROYAL_ORANGE,
                                          ),
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        AppIcons.ORDEN,
                                        width:
                                            SizeConfig.calculateBlockHorizontal(
                                                6.67),
                                        height:
                                            SizeConfig.calculateBlockVertical(
                                                12.98),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: SizeConfig
                                              .calculateBlockHorizontal(8.67),
                                          right: SizeConfig
                                              .calculateBlockHorizontal(8.51),
                                        ),
                                        child: Text(
                                          "12",
                                          style: TextStyle(
                                            fontSize:
                                                SizeConfig.calculateTextSize(
                                                    10),
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.VIOLET_BLUE,
                                          ),
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        AppIcons.SHAKE_HAND,
                                        width:
                                            SizeConfig.calculateBlockHorizontal(
                                                14.92),
                                        height:
                                            SizeConfig.calculateBlockVertical(
                                                9.74),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: SizeConfig
                                              .calculateBlockHorizontal(4.57),
                                          right: SizeConfig
                                              .calculateBlockHorizontal(12),
                                        ),
                                        child: Text(
                                          "45",
                                          style: TextStyle(
                                            fontSize:
                                                SizeConfig.calculateTextSize(
                                                    10),
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.ROYAL_ORANGE,
                                          ),
                                        ),
                                      ),
                                      getText(
                                        text: "509 fikrlar",
                                        fontSize:
                                            SizeConfig.calculateTextSize(10),
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.SHADOW_BLUE,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }

  getOutlinedButton(dynamic onPressed, String text, Color color,
      Color borderColor, Color textColor,
      [Widget? icon]) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.calculateBlockVertical(56),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide(
            width: 1.0,
            color: borderColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getCircleAvatar(Responsible user) {
    return Column(
      children: [
        Image.asset(
          AppImages.BORDER,
          width: SizeConfig.calculateBlockHorizontal(60),
          height: SizeConfig.calculateBlockVertical(60),
        ),
        getText(
          text: user.user?.fullName ?? "- - - -",
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.BLACK,
        ),
        getText(
          text: user.job?.name ?? "- - - -",
          fontSize: 10,
          fontWeight: FontWeight.w300,
          color: AppColors.SHADOW_BLUE,
        )
      ],
    );
  }

  getDiscounts() {
    return Positioned(
      left: SizeConfig.calculateBlockHorizontal(16),
      top: SizeConfig.calculateBlockVertical(12),
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

  Widget getPriceContainer(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.calculateBlockHorizontal(2),
      ),
      child: Container(
        width: SizeConfig.calculateBlockHorizontal(45),
        height: SizeConfig.calculateBlockVertical(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(14),
              fontWeight: FontWeight.w400,
              color: AppColors.WHITE,
            ),
          ),
        ),
      ),
    );
  }

  Widget getText({
    required String text,
    required double fontSize,
    required fontWeight,
    required Color color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  buildAppBar() {
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
        _controllerOffers.selectedOffer?.name ?? "- - - -",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.BLACK,
        ),
      ),
    );
  }

  buildHeader() {
    return GetBuilder(
        init: _controllerOffers,
        id: _controllerOffers.carouselId,
        builder: (context) {
          final id = _controllerOffers.selectedOffer?.id;
          final gallery = _controllerOffers.offerGalleries[id];
          Get.log("gallery is $gallery");
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: SizeConfig.screenHeight! * 375 / 812,
                child: PageView(
                  children: List.generate(gallery?.length ?? 1, (index) {
                    if (gallery == null) {
                      return SvgPicture.asset(
                        AppIcons.PLACE_HOLDER,
                        fit: BoxFit.cover,
                      );
                    }
                    final image = gallery[index];
                    return Image.network(
                      image.thumbnail ?? image.image ?? "",
                      fit: BoxFit.cover,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) =>
                              child,
                      errorBuilder: (context, error, stackTrace) =>
                          SvgPicture.asset(
                        AppIcons.PLACE_HOLDER,
                        fit: BoxFit.cover,
                      ),
                      loadingBuilder: (context, child, loadingProgress) =>
                          Center(
                        child: child,
                      ),
                    );
                  }),
                  controller: _controller,
                ),
              ),
              if (gallery != null && gallery.length > 1)
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  // ignore: prefer_const_constructors
                  child: DotIndicator(
                      count: gallery.length,
                      dotSize: const Size(4, 4),
                      spacing: 4,
                      pageController: _controller),
                ),
              getDiscounts(),
              if (gallery != null && gallery.length > 1)
                Positioned(
                  right: SizeConfig.calculateBlockHorizontal(16),
                  top: SizeConfig.calculateBlockVertical(12),
                  child: Container(
                    height: SizeConfig.calculateBlockVertical(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.SHADOW_BLUE,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Text(
                        "${_controllerOffers.currentPage}/${gallery.length}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(12),
                          fontWeight: FontWeight.w400,
                          color: AppColors.WHITE,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        });
  }

  buildDetails() {
    final data = _controllerOffers.offerDetails;
    return [
      getText(
        text: data.name ?? "- - - -",
        fontSize: SizeConfig.calculateTextSize(16),
        fontWeight: FontWeight.w500,
        color: AppColors.BLACK,
      ),
      getText(
        text: '${data.qty ?? "-"} pieces available',
        fontSize: SizeConfig.calculateTextSize(12),
        fontWeight: FontWeight.w300,
        color: AppColors.SHADOW_BLUE,
      ),
      SizedBox(
        height: SizeConfig.calculateBlockVertical(12),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getText(
            text: "${data.cost} UZS",
            fontSize: SizeConfig.calculateTextSize(22),
            fontWeight: FontWeight.w600,
            color: AppColors.BLACK,
          ),
          if (data.discount != null)
            SizedBox(
              width: SizeConfig.calculateBlockHorizontal(12),
            ),
          if (data.discount != null)
            Text(
              "${data.discount} UZS",
              style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(16),
                fontWeight: FontWeight.w400,
                color: AppColors.SUNSET_ORANGE,
                decoration: TextDecoration.lineThrough,
              ),
            ),
        ],
      ),
    ];
  }

  buildSpecialists() {
    final data = _controllerOffers.offerDetails;
    return [
      getText(
        text: "Choose a specialist for this offer",
        fontSize: SizeConfig.calculateTextSize(16),
        fontWeight: FontWeight.w500,
        color: AppColors.BLACK,
      ),
      SizedBox(
        height: SizeConfig.calculateBlockVertical(12),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: data.responsible!.map<Widget>((element) {
          return getCircleAvatar(element);
        }).toList(),
      ),
    ];
  }

  buildDescription() {
    final data = _controllerOffers.offerDetails;
    return [
      getText(
        text: "Description",
        fontSize: SizeConfig.calculateTextSize(16),
        fontWeight: FontWeight.w600,
        color: AppColors.BLACK,
      ),
      SizedBox(
        height: SizeConfig.calculateBlockVertical(8),
      ),
      getText(
        text: data.description ?? "There is no description for this item!",
        fontSize: SizeConfig.calculateTextSize(14),
        fontWeight: FontWeight.w300,
        color: AppColors.SHADOW_BLUE,
      )
    ];
  }
}
