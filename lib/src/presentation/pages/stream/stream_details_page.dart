import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

class StreamDetailsPage extends StatefulWidget {
  const StreamDetailsPage({Key? key}) : super(key: key);

  @override
  State<StreamDetailsPage> createState() => _StreamDetailsPageState();
}

class _StreamDetailsPageState extends State<StreamDetailsPage> {
  bool isComment = false;
  @override
  Widget build(BuildContext context) {
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
          '''Stream name''',
          style: TextStyle(
            fontSize: SizeConfig.calculateTextSize(16),
            fontWeight: FontWeight.w500,
            color: AppColors.BLACK,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.calculateBlockHorizontal(16),
              ),
              child: SvgPicture.asset(
                AppIcons.MORE,
                color: AppColors.BLACK,
                // fit: BoxFit.cover,
                height: SizeConfig.calculateBlockVertical(24),
                width: SizeConfig.calculateBlockHorizontal(24),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: !isComment ? SizedBox(
        width: SizeConfig.calculateBlockHorizontal(48),
        height: SizeConfig.calculateBlockVertical(48),
        child: ElevatedButton(
          onPressed: () {
            setState(
              () {
                isComment ? (isComment = false) : (isComment = true);
                print(isComment);
              },
            );
          },
          child: Center(
            child: SvgPicture.asset(
              AppIcons.COMMENT,
              width: SizeConfig.calculateBlockHorizontal(24),
              height: SizeConfig.calculateBlockVertical(24),
            ),
          ),
          style: ElevatedButton.styleFrom(
            alignment: Alignment.bottomRight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(120),
            ),
          ),
        ),
      ): const SizedBox(),
      body: Column(
        children: [
          Image.asset(
            AppImages.VIDEO_FRAME,
            width: double.infinity,
            height: SizeConfig.calculateBlockVertical(240),
            fit: BoxFit.cover,
          ),
          isComment ? getCommentPart() : getListTileItem(),
        ],
      ),
    );
  }

  getListTileItem() {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.calculateTextSize(16),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.STREAM_LIVE,
                width: SizeConfig.calculateBlockHorizontal(48),
                height: SizeConfig.calculateBlockVertical(48),
              ),
              SizedBox(
                width: SizeConfig.calculateBlockHorizontal(8),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consec\nadipiscing elit Non",
                    style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(4),
                  ),
                  Row(
                    children: [
                      Text(
                        "T-MED",
                        style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(16),
                          fontWeight: FontWeight.w400,
                          color: AppColors.SHADOW_BLUE,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.calculateBlockHorizontal(163),
                      ),
                      SvgPicture.asset(AppIcons.EYE),
                      Text(
                        "10.5K",
                        style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(16),
                          fontWeight: FontWeight.w400,
                          color: AppColors.BLACK,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(10.5),
                  ),
                  Row(
                    children: [
                      getSmallContainer("Math"),
                      getSmallContainer("Beginner"),
                      getSmallContainer("Uzbek"),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
          ),
          getDescriptionPart(),
        ],
      ),
    );
  }

  getSmallContainer(String text) {
    return Container(
      margin: EdgeInsets.only(
        right: SizeConfig.calculateBlockHorizontal(8),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.calculateBlockHorizontal(8),
        vertical: SizeConfig.calculateBlockVertical(4),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.ANTI_FLASH_WHITE,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: SizeConfig.calculateTextSize(10),
            fontWeight: FontWeight.w400,
            color: AppColors.SHADOW_BLUE,
          ),
        ),
      ),
    );
  }

  getDescriptionPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: SizeConfig.calculateTextSize(16),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(8),
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis magna orci, sit accumsan scelerisqe. Vehicula arcu, scelerisque id in. Velit, iaculis sem purus lobortis. Adipiscing quam egestas odio habitant eget massa. Suspendisse proin et diam tellus arcu...more",
          style: TextStyle(
            fontSize: SizeConfig.calculateTextSize(14),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(24),
        ),
        Text(
          "Today's schedule",
          style: TextStyle(
            fontSize: SizeConfig.calculateTextSize(16),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  getCommentPart() {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.calculateTextSize(16),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Live chat",
                  style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SvgPicture.asset(
                  AppIcons.ARROW_DOWN,
                )
              ],
            ),
          ),
          getCommentAvatar(),
        ],
      ),
    );
  }

  getCommentAvatar() {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.calculateTextSize(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppImages.COMMENT_AVATAR,
            width: SizeConfig.calculateBlockHorizontal(48),
            height: SizeConfig.calculateBlockVertical(48),
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(8),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Ashlynn Lubin",
                    style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(14),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.calculateBlockHorizontal(5),
                  ),
                  Text(
                    "4m",
                    style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(12),
                      fontWeight: FontWeight.w400,
                      color: AppColors.SHADOW_BLUE,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(4),
              ),
              Text(
                "If we program the program, we can get to\nthe AI monitor through the online THX\ninterface!",
                style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(14),
                  fontWeight: FontWeight.w400,
                  color: AppColors.BLACK,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
