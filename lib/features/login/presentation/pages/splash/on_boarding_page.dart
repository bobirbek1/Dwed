import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app/app_colors.dart';
import '../../widgets/indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();

}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController controller = PageController(initialPage: 3);

  void _pageChanged(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.grey,
            child: PageView.builder(
              onPageChanged: _pageChanged,
              controller: controller,
              itemBuilder: (context, index) {
                return getData(title[index], subTitle[index],);
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
          const Padding(
            padding: EdgeInsets.only(
              top: 64,
              left: 314,
              right: 32,
            ),
            child: Text(
              "Skip",
              style: TextStyle(
                color: AppColors.BLACK,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 520,
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
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Indicator(
                  controller: controller,
                  itemCount: 5,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    "assets/icons/Combined Shape.svg",
                    color: Colors.white,
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