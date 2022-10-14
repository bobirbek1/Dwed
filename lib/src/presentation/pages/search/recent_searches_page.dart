import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class RecentSearchPage extends StatelessWidget {
  RecentSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.calculateBlockHorizontal(16),
        vertical: SizeConfig.calculateBlockVertical(16),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getText(
                  text: "Recent searches",
                  fontSize: 18,
                  color: AppColors.BLACK,
                  fontWeight: FontWeight.w500,
                ),
                TextButton(
                  onPressed: () {},
                  child: getText(
                    text: "Clear",
                    fontSize: 16,
                    color: AppColors.SHADOW_BLUE,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            getListViewRecent(),
            getText(
              text: "Popular searches",
              fontSize: 18,
              color: AppColors.BLACK,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(12),
            ),
            getListViewPopular(),
          ],
        ),
      ),
    );
  }

  getText({
    required String text,
    required double fontSize,
    required Color color,
    required dynamic fontWeight,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  getListViewRecent() {
    return ListView.builder(
        itemCount: iconsRecent.length,
        
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: SizeConfig.calculateBlockVertical(20),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  iconsRecent[index],
                ),
                SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(12),
                ),
                getText(
                  text: titleRecent[index],
                  fontSize: SizeConfig.calculateTextSize(16),
                  color: AppColors.BLACK,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          );
        });
  }

  List<String> iconsRecent = [
    AppIcons.TIME_CLOCK,
    AppIcons.TIME_CLOCK,
    AppIcons.TIME_CLOCK,
  ];
  List<String> titleRecent = [
    "Iphone 12 pro ",
    "Shox medical hospital",
    "Umida Asqarova",
  ];
  getListViewPopular() {
    return ListView.builder(
        itemCount: titlePopular.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: SizeConfig.calculateBlockVertical(20),
            ),
            child: getText(
              text: titlePopular[index],
              fontSize: SizeConfig.calculateTextSize(16),
              color: AppColors.BLACK,
              fontWeight: FontWeight.w400,
            ),
          );
        });
  }

  List<String> titlePopular = [
    "🔥 Iphone 14 pro ",
    "Playstation 6",
    "Pepsi",
  ];
}
