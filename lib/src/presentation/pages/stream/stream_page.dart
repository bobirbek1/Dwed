import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';

import '../../../../app/app_icons.dart';
import '../../../../core/utils/size_config.dart';

class StreamPage extends StatelessWidget {
  bool typing = true;
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Column(
        children: [getStreamCategoriesList(), getStreamList()],
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      leading: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.calculateBlockHorizontal(16),
              right: SizeConfig.calculateBlockHorizontal(6),
            ),
            child: SvgPicture.asset(AppIcons.SHAPE),
          ),
           Padding(
              padding: EdgeInsets.zero,
              child: SvgPicture.asset(
                AppIcons.DWED,
                height: SizeConfig.calculateBlockVertical(11),
              ),
            ),
        ],
      ),
      title: const Text(
        "Stream Video",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.BLACK,
        ),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.calculateBlockHorizontal(19),
            ),
            child: SvgPicture.asset(AppIcons.SEARCH_NORMAL)),
        Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.calculateBlockHorizontal(19),
            ),
            child: SvgPicture.asset(AppIcons.FILTER)),
      ],
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.WHITE,
    );
  }

  getStreamCategoriesList() {
    return Container(
      height: 56,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 12,
          itemBuilder: (_, int index) {
            return Center(
              child: Container(
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.BLACK),
                    color: AppColors.GRAY_X11),
                child: Text(
                  "Categories",
                  style: TextStyle(color: AppColors.BLACK, fontSize: 18),
                ),
              ),
            );
          }),
    );
  }

  getStreamList() {
    return Expanded(
      child: Container(
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (_, int index) {
              return getStreamListItem();
            }),
      ),
    );
  }

  getStreamListItem() {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.ROYAL_ORANGE),
                ),
                Positioned(
                  child: Container(
                      margin: const EdgeInsets.only(top: 8, left: 8),
                      padding: const EdgeInsets.only(
                          top: 3, left: 6, right: 6, bottom: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.RED),
                      child: const Text(
                        "Live",
                        style: TextStyle(color: AppColors.WHITE, fontSize: 18),
                      )),
                ),
                Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: AppColors.MAIN_TEXT_COLOR,
                          borderRadius: BorderRadius.circular(16)),
                      child: const Text(
                        "10.5K Views",
                        style: TextStyle(fontSize: 18, color: AppColors.WHITE),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: SizeConfig.calculateBlockHorizontal(48),
                      height: SizeConfig.calculateBlockVertical(48),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24)),
                      child: Image.asset(AppImages.PHONES_SMARTWATCHES)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Math for kids",
                        style: TextStyle(color: AppColors.BLACK, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Math WARS",
                        style: TextStyle(
                            color: AppColors.MAIN_TEXT_COLOR, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 4, top: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.GRAY_X11),
                        child: const Text(
                          "Math",
                          style: TextStyle(
                              color: AppColors.MAIN_TEXT_COLOR, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
