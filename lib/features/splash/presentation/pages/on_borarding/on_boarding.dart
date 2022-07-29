import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                color: Colors.black,
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
              children: const [
                Text(
                  "Представление ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Пора управлять временем,контролировать свою",
                  style: TextStyle(
                    color: Colors.grey,
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
              left: 32,
              right: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Rectangle 951.svg",
                      width: 12,
                      height: 4,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SvgPicture.asset(
                      "assets/icons/Rectangle 951.svg",
                      width: 12,
                      height: 4,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SvgPicture.asset(
                      "assets/icons/Rectangle 951.svg",
                      width: 12,
                      height: 4,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SvgPicture.asset(
                      "assets/icons/Rectangle 951.svg",
                      width: 12,
                      height: 4,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                  ],
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
}
