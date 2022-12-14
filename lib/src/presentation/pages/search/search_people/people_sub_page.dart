import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

class PeopleSubPage extends StatelessWidget {
  PeopleSubPage({Key? key}) : super(key: key);
  final title = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: getAppBar(),
      body: getItems(),
    );
  }

  getAppBar() {
    return AppBar(
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
        title.toString(),
        style: TextStyle(
          fontSize: SizeConfig.calculateTextSize(16),
          color: AppColors.BLACK,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        InkWell(
          child: Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.calculateBlockHorizontal(19),
            ),
            child: SvgPicture.asset(AppIcons.SEARCH_NORMAL),
          ),
        ),
      ],
    );
  }

  getOutlinedButton() {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.calculateBlockHorizontal(16),
      ),
      child: OutlinedButton(
        onPressed: () {},
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.calculateBlockVertical(45),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.calculateBlockHorizontal(11),
                vertical: SizeConfig.calculateBlockVertical(11),
              ),
              child: FittedBox(
                child: Text(
                  "Show all specialists",
                  style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(14),
                    fontWeight: FontWeight.w400,
                    color: AppColors.BUTTON_BLUE,
                  ),
                ),
              ),
            ),
          ),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.calculateBlockHorizontal(100),
            ),
          ),
          side: const BorderSide(color: AppColors.BUTTON_BLUE),
        ),
      ),
    );
  }

  getItems() {
    return Column(
      children: [
        getOutlinedButton(),
        Expanded(
          child: ListView.builder(
              itemCount: educationPageItemsIcons.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.PEOPLES_SUB_DETAILS_PAGE,
                      arguments: educationPageItemsTitles[index],
                    );
                  },
                  child: Column(
                    children: [
                      ListTile(
                        leading: SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(56),
                          height: SizeConfig.calculateBlockVertical(56),
                          child: Image.asset(educationPageItemsIcons[index]),
                        ),
                        title: Text(
                          educationPageItemsTitles[index],
                          style: TextStyle(
                            color: AppColors.BLACK,
                            fontSize: SizeConfig.calculateTextSize(16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          educationPageItemsSubtitles[index],
                          style: TextStyle(
                            color: AppColors.SHADOW_BLUE,
                            fontSize: SizeConfig.calculateTextSize(12),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Divider(
                        indent: SizeConfig.calculateBlockHorizontal(88),
                        height: SizeConfig.calculateBlockVertical(8),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  List<String> educationPageItemsIcons = [
    AppImages.SPEC_ALERGIST,
    AppImages.SPEC_CARDIOLOG,
    AppImages.SPEC_DERMATOLOG,
    AppImages.SPEC_ENDOCRINOLOG,
    AppImages.SPEC_OPHTHALMOLOG,
    AppImages.SPEC_PEDIATRIC,
  ];
  List<String> educationPageItemsTitles = [
    "Allergists",
    "Cardiologists",
    "Dermatologists",
    "Endocrinolodists",
    "Ophthalmologists",
    "Pediatricians",
  ];
  List<String> educationPageItemsSubtitles = [
    "500 specialists",
    "500 specialists",
    "500 specialists",
    "500 specialists",
    "500 specialists",
    "500 specialists",
  ];
}
