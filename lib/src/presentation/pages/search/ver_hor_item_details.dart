import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_template/src/presentation/controller/offers/offers_controller.dart';
import 'package:get/get.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
];


class ItemDetailsPage extends StatelessWidget {
  int _current = 0;

  final CarouselController _controller = CarouselController();
  final _controllerOffers = Get.find<OffersController>();

  @override
  Widget build(BuildContext context) {

    final List<Widget> images = [
      Image.asset(
        AppImages.DACHA,
        width: double.infinity,
        height: SizeConfig.calculateBlockVertical(375),
        fit: BoxFit.cover,
      ),
      Image.asset(
        AppImages.DACHA_1,
        width: double.infinity,
        height: SizeConfig.calculateBlockVertical(375),
        fit: BoxFit.cover,
      ),
      Image.asset(
        AppImages.DACHA_2,
        width: double.infinity,
        height: SizeConfig.calculateBlockVertical(375),
        fit: BoxFit.cover,
      ),
      Image.asset(
        AppImages.DACHA_3,
        width: double.infinity,
        height: SizeConfig.calculateBlockVertical(375),
        fit: BoxFit.cover,
      ),
      Image.asset(
        AppImages.DACHA_4,
        width: double.infinity,
        height: SizeConfig.calculateBlockVertical(375),
        fit: BoxFit.cover,
      ),
    ];
    int length = images.length;

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
           '-----',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.BLACK,
          ),
        ),
      ),
      body: GetBuilder(
        builder: (GetxController controller) {
         // final data = _controllerOffers.productsPageItem;
          return _controllerOffers.offersStateProductPage == OffersState.error ?
              const Center(child: Text('Error'),) :
              _controllerOffers.offersStateProductPage == OffersState.loading ?
                  const CircularProgressIndicator() :
        SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CarouselSlider(
                      items: images,
                      carouselController: _controller,
                      options: CarouselOptions(
                        height: SizeConfig.calculateBlockVertical(375),
                        autoPlay: false,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        disableCenter: true,
                        viewportFraction: 1,
                        // aspectRatio: SizeConfig.calculateBlockHorizontal(475)/SizeConfig.calculateBlockVertical(400),
                        onPageChanged: (index, reason) {

                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: SizeConfig.calculateBlockHorizontal(6),
                              height: SizeConfig.calculateBlockVertical(6),
                              margin: EdgeInsets.symmetric(
                                vertical: SizeConfig.calculateBlockVertical(12),
                                horizontal:
                                    SizeConfig.calculateBlockHorizontal(4),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.WHITE
                                        : AppColors.WHITE)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  getPrice(),
                  Positioned(
                    left: SizeConfig.calculateBlockHorizontal(363),
                    top: SizeConfig.calculateBlockVertical(12),
                    child: Container(
                      width: SizeConfig.calculateBlockHorizontal(36),
                      height: SizeConfig.calculateBlockVertical(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.SHADOW_BLUE,
                      ),
                      child: Center(
                        child: Text(
                          "${_current + 1}/$length",
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
              ),
              Padding(
                padding: EdgeInsets.all(
                  SizeConfig.calculateBlockHorizontal(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                      text:
                          '''13 kishilik "Yovvoyi G'arb" uyi (dam olish\nkunlari)''',
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w500,
                      color: AppColors.BLACK,
                    ),
                    getText(
                      text: '''254 pieces available''',
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
                          text: "24 408 000 UZS",
                          fontSize: SizeConfig.calculateTextSize(22),
                          fontWeight: FontWeight.w600,
                          color: AppColors.BLACK,
                        ),
                        SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(12),
                        ),
                        Text(
                          "32 400 000 UZS",
                          style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(16),
                            fontWeight: FontWeight.w400,
                            color: AppColors.SUNSET_ORANGE,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(16),
                    ),
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
                      children: [
                        getCircleAvatar(),
                        getCircleAvatar(),
                        getCircleAvatar(),
                        getCircleAvatar(),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(24),
                    ),
                    getOutlinedButton(
                      (){},
                      "Savatga qo'shish",
                      AppColors.WHITE,
                      AppColors.BUTTON_BLUE,
                      AppColors.BUTTON_BLUE,
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.BAG,
                            width: SizeConfig.calculateBlockHorizontal(24),
                            height: SizeConfig.calculateBlockVertical(24),
                            color: AppColors.BUTTON_BLUE,
                          ),
                          SizedBox(
                            width: SizeConfig.calculateBlockHorizontal(8),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(12),
                    ),
                    getOutlinedButton(
                          (){},
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
                          (){ Get.toNamed(AppRoutes.CARTPAGE);},
                      "Hoziroq rasmiylashtirish",
                      AppColors.BUTTON_BLUE,
                      AppColors.WHITE,
                      AppColors.WHITE,
                      const SizedBox(),
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(24),
                    ),
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
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam odio est morbi diam convallis. Placerat non elit sit ut. Lorem lacinia proin egestas mauris, sed egestas hendrerit. Nascetur diam nunc, dui odio dignissim neque. Elementum magna...more",
                      fontSize: SizeConfig.calculateTextSize(14),
                      fontWeight: FontWeight.w300,
                      color: AppColors.SHADOW_BLUE,
                    ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(
                          text: "Ajratish turi",
                          fontSize: SizeConfig.calculateTextSize(14),
                          fontWeight: FontWeight.w300,
                          color: AppColors.BLACK,
                        ),
                        getText(
                          text: "Oilaviy kvartira",
                          fontSize: SizeConfig.calculateTextSize(14),
                          fontWeight: FontWeight.w400,
                          color: AppColors.BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(
                          text: "Odamlar soni",
                          fontSize: SizeConfig.calculateTextSize(14),
                          fontWeight: FontWeight.w300,
                          color: AppColors.BLACK,
                        ),
                        getText(
                          text: "13",
                          fontSize: SizeConfig.calculateTextSize(14),
                          fontWeight: FontWeight.w400,
                          color: AppColors.BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(
                          text: "Texnika",
                          fontSize: SizeConfig.calculateTextSize(14),
                          fontWeight: FontWeight.w300,
                          color: AppColors.BLACK,
                        ),
                        getText(
                          text: "Wi-Fi, Televizor",
                          fontSize: SizeConfig.calculateTextSize(14),
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
                        width: SizeConfig.calculateBlockHorizontal(48),
                        height: SizeConfig.calculateBlockVertical(48),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getText(
                            text: "Anhor Relax Zone",
                            fontSize: SizeConfig.calculateTextSize(16),
                            fontWeight: FontWeight.w500,
                            color: AppColors.BLACK,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.CALL_CALLING,
                                width: SizeConfig.calculateBlockHorizontal(24),
                                height: SizeConfig.calculateBlockVertical(24),
                              ),
                              SizedBox(
                                width: SizeConfig.calculateBlockHorizontal(16),
                              ),
                              SvgPicture.asset(
                                AppIcons.MESSENGER,
                                width: SizeConfig.calculateBlockHorizontal(24),
                                height: SizeConfig.calculateBlockVertical(24),
                              )
                            ],
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.MAGISTR,
                            width: SizeConfig.calculateBlockHorizontal(13.94),
                            height: SizeConfig.calculateBlockVertical(11.63),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.calculateBlockHorizontal(4.67),
                              right: SizeConfig.calculateBlockHorizontal(12.67),
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
                            width: SizeConfig.calculateBlockHorizontal(6.67),
                            height: SizeConfig.calculateBlockVertical(12.98),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.calculateBlockHorizontal(8.67),
                              right: SizeConfig.calculateBlockHorizontal(8.51),
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
                            width: SizeConfig.calculateBlockHorizontal(14.92),
                            height: SizeConfig.calculateBlockVertical(9.74),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.calculateBlockHorizontal(4.57),
                              right: SizeConfig.calculateBlockHorizontal(12),
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
                          getText(
                            text: "509 fikrlar",
                            fontSize: SizeConfig.calculateTextSize(10),
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

  getOutlinedButton(dynamic onPressed,
      String text, Color color, Color borderColor, Color textColor,
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

  getCircleAvatar() {
    return Column(
      children: [
        Image.asset(
          AppImages.BORDER,
          width: SizeConfig.calculateBlockHorizontal(60),
          height: SizeConfig.calculateBlockVertical(60),
        ),
        getText(
          text: "Umarova",
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.BLACK,
        ),
        getText(
          text: "Sotuv manageri",
          fontSize: 10,
          fontWeight: FontWeight.w300,
          color: AppColors.SHADOW_BLUE,
        )
      ],
    );
  }

  getPrice() {
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
}
