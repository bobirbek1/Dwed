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
      appBar:getAppBar(
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
          controller: textController,
          cursorHeight: 24,
          onChanged: (val) {
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
      body: Column(
        children: [getStreamCategoriesList(), getStreamList()],
      ),
    );
  }

   getAppBar(Widget leading, Widget title, double leadingWidth) {
    return  AppBar(
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

          },
          child: Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.calculateBlockHorizontal(19),
              ),
              child: SvgPicture.asset(AppIcons.SEARCH_NORMAL)),
        )
            : textController.text.isEmpty
            ? const SizedBox()
            : InkWell(
          onTap: () {

          },
          child: Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.calculateBlockHorizontal(19),
            ),
            child: SvgPicture.asset(AppIcons.CLOSE_SEARCHFIELD),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: SizeConfig.calculateBlockHorizontal(19),
          ),
          child: SvgPicture.asset(AppIcons.FILTER),
        ),
      ],
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
                    border: Border.all(color: AppColors.MAIN_TEXT_COLOR),
                    ),
                child: Text(
                  "Categories",
                  style: TextStyle(color: AppColors.MAIN_TEXT_COLOR, fontSize: 18),
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
      margin: const EdgeInsets.only(top: 8, bottom:8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
              height: 12,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: SizeConfig.calculateBlockHorizontal(48),
                      height: SizeConfig.calculateBlockVertical(48),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48)),
                      child: Image.asset(AppImages.PHONES_PHONES)),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Math for kids",
                          style: TextStyle(color: AppColors.BLACK, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "MATH WARS",
                          style: TextStyle(
                              color: AppColors.MAIN_TEXT_COLOR, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          children:[
                            Container(
                              margin: EdgeInsets.only(right: 4),
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
                          ),
                            Container(
                              margin: EdgeInsets.only(right: 4),
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 4, top: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.GRAY_X11),
                              child: const Text(
                                "Beginner",
                                style: TextStyle(
                                    color: AppColors.MAIN_TEXT_COLOR, fontSize: 12),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 4),
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 4, top: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.GRAY_X11),
                              child: const Text(
                                "Uzbek",
                                style: TextStyle(
                                    color: AppColors.MAIN_TEXT_COLOR, fontSize: 12),
                              ),
                            ),
                        ])
                      ],
                    ),
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
