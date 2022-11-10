import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/src/presentation/widgets/indicator.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController controller = PageController(initialPage: 0);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.WHITE,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: InkWell(
                  onTap: () {

                    Get.offAllNamed(AppRoutes.LOGIN);
                  },
                  child: Text(
                    "otkazish".tr,
                    style: const TextStyle(
                      color: AppColors.BLACK,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
        ],
      ),
      backgroundColor: AppColors.WHITE,
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              itemCount: 4,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              controller: controller,
              itemBuilder: (context, index) {
                return getData(title[index], subTitle[index], images[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              bottom: 64,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotIndicator(dotSize: const Size(12,4), spacing: 4,count: 4, pageController: controller),
                const Expanded(child: SizedBox()),
                FloatingActionButton(
                  onPressed: () {
                    if (currentPage == 3) {
                      Get.offAllNamed(AppRoutes.LOGIN);
                    } else {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.ease);
                    }
                  },
                  child: SvgPicture.asset('assets/icons/Combined Shape.svg'),
                  backgroundColor: AppColors.BUTTON_BLUE,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getData(String title, String subTitle, dynamic image) {
    return Column(
      children: [
        Expanded(
          child: image,
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.BLACK,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 78,
            right: 78,
            bottom: 74,
          ),
          child: Text(
            subTitle,
            style: const TextStyle(
              color: AppColors.GRAY_X11,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  List<String> title = [
    "Представление",
    "Возможности",
    "Представление",
    "Представление",
  ];

  List<String> subTitle = [
    "Пора управлять временем,контролировать свою",
    "Контроль времени, Твое слово имеет слово быть",
    "Пора управлять временем, контролировать свою",
    "Пора управлять временем, контролировать свою",
  ];
  List<dynamic> images = [
    SvgPicture.asset(
      'assets/icons/icon_logo.svg',
      color: AppColors.BUTTON_BLUE,
      fit: BoxFit.contain,
      width: 200,
      height: 200,
    ),
    SvgPicture.asset(
      'assets/icons/bag-2.svg',
      color: AppColors.BUTTON_BLUE,
      fit: BoxFit.contain,
      width: 200,
      height: 200,
    ),
    SvgPicture.asset(
      'assets/images/video-square.svg',
      color: AppColors.BUTTON_BLUE,
      fit: BoxFit.contain,
      width: 200,
      height: 200,
    ),
    SvgPicture.asset(
      'assets/icons/location.svg',
      color: AppColors.BUTTON_BLUE,
      fit: BoxFit.contain,
      width: 200,
      height: 200,
    ),
  ];
}
