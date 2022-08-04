import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/features/login/presentation/widgets/indicator.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController controller = PageController(initialPage: 0);
  int index = 0;

  void _pageChanged(int index) {
    this.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: AppColors.GRAY_X11,
            child: PageView.builder(
              itemCount: 4,
              onPageChanged: _pageChanged,
              controller: controller,
              itemBuilder: (context, index) {
                return getData(
                  title[index],
                  subTitle[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  getData(String title, String subTitle) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 64,
              left: 314,
              right: 32,
            ),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.LOGIN);
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: AppColors.BLACK,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 514,
              left: 73,
              right: 73,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.BLACK,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: AppColors.GRAY_X11,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 32,
              right: 32,
              bottom: 64,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Indicator(
                  controller: controller,
                  itemCount: 5,
                ),
                FloatingActionButton(
                  backgroundColor: AppColors.BUTTON_BLUE,
                  onPressed: () {
                    if (index < 3) {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    } else {
                      Get.offNamed(AppRoutes.LOGIN);
                    }
                  },
                  child: SvgPicture.asset(
                    "assets/icons/Combined Shape.svg",
                    color: AppColors.WHITE,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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
}
