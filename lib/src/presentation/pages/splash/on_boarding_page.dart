import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/src/presentation/widgets/splash/indicator.dart';
import 'package:get/get.dart';
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController controller = PageController(initialPage: 0);

  void _pageChanged(int index) {
    this.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: const [
              Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.only(right: 32.0, top: 64),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: AppColors.BLACK,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 4,
              onPageChanged: _pageChanged,
              controller: controller,
              itemBuilder: (context, index) {
                return getData(
                  title[index],
                  subTitle[index],
                 images[index]);
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
                Indicator(
                  controller: controller,
                  itemCount: 4,
                ),
                const Expanded(child: SizedBox()),
                FloatingActionButton(
                  onPressed: () {},
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
