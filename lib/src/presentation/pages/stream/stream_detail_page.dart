import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';

import '../../../../app/app_icons.dart';
import '../../../../core/utils/size_config.dart';

class StreamDetailsPage extends StatelessWidget {
  const StreamDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.ARROW_LEFT,
                color: Colors.black,
              )),
          'Stream name'),
      body: getStreamDetails(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: Icon(Icons.message),
      ),
    );
  }

  getAppBar(Widget leading, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.3,
      leading: leading,
      title: Container(
        padding: EdgeInsets.zero,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(
            top: 4,
            bottom: 4,
            left: SizeConfig.calculateBlockHorizontal(16),
            right: SizeConfig.calculateBlockHorizontal(6),
          ),
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.ICON_MORE,
                color: Colors.black,
              )),
        )
      ],
    );
  }

  getStreamDetails() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.calculateBlockVertical(240),
            decoration: BoxDecoration(color: AppColors.ROYAL_ORANGE),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: SizeConfig.calculateBlockHorizontal(48),
                    height: SizeConfig.calculateBlockVertical(48),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(48)),
                    child: Image.asset(AppImages.PHONES_PHONES)),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Container(
                    height: SizeConfig.calculateBlockVertical(120),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              "Lorem ipsum dolor sit amet,\n consec adipiscing elit Non",
                              style: TextStyle(
                                  color: AppColors.BLACK,
                                  fontSize: 16,
                                  height: 1.2),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "T-MED",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.MAIN_TEXT_COLOR),
                                ),
                                // Expanded(child: Container()),
                                SizedBox(
                                  width:
                                      SizeConfig.calculateBlockHorizontal(200),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      SvgPicture.asset(AppIcons.ICON_EYE),
                                      Text("10.5K")
                                    ]),
                              ]),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Wrap(children: [
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
                                      color: AppColors.MAIN_TEXT_COLOR,
                                      fontSize: 12),
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
                                      color: AppColors.MAIN_TEXT_COLOR,
                                      fontSize: 12),
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
                                      color: AppColors.MAIN_TEXT_COLOR,
                                      fontSize: 12),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Description",
              style: TextStyle(
                  color: AppColors.BLACK,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Expanded(
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis magna orci, sit accumsan scelerisqe. Vehicula arcu, scelerisque id in. Velit, iaculis sem purus lobortis. Adipiscing quam egestas odio habitant eget massa. Suspendisse proin et diam tellus arcu...more",
                style: TextStyle(
                    color: AppColors.BLACK, fontSize: 14, height: 1.2),
                maxLines: 5,
                softWrap: true,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Expanded(
              child: Text(
                "Today Schedule",
                style: TextStyle(
                    color: AppColors.BLACK,
                    fontWeight: FontWeight.bold,
                    fontSize: 16, height: 1.2
                ),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
