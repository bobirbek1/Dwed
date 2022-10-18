import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class SearchTyping extends StatelessWidget {
  const SearchTyping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getMainText(mainText: "Offers"),
          getSearchTypingItemsShort(
            image: AppImages.IPHONE_13,
            title: "Smartphone iPhone 12 Pro 128GB Graphite",
            subtitle: "11 124 000 UZS",
          ),
          getSearchTypingItemsShort(
            image: AppImages.IPHONE_13,
            title: "Smartphone iPhone 12 Pro 128GB Graphite",
            subtitle: "11 124 000 UZS",
          ),
          getSearchTypingItemsShort(
            image: AppImages.IPHONE_13,
            title: "Smartphone iPhone 12 Pro 128GB Graphite",
            subtitle: "11 124 000 UZS",
          ),
          getViewButton("Offers"),
          getMainText(mainText: "Streams"),
          getSearchTypingItemsShort(
            image: AppImages.SCREEN,
            title: "Math 1-lesson",
            subtitle: "NASA ACADEMY",
          ),
          getSearchTypingItemsShort(
            image: AppImages.SCREEN,
            title: "Math 1-lesson",
            subtitle: "NASA ACADEMY",
          ),
          getSearchTypingItemsShort(
            image: AppImages.SCREEN,
            title: "Math 1-lesson",
            subtitle: "NASA ACADEMY",
          ),
          getViewButton("Streams"),
          getMainText(mainText: "Organizations"),
          getSearchTypingItemsLong(
            image: AppImages.TEMIR_YOL,
            title: "Markaziy temir yo'l\npoliklinikasi",
            subtitle: "Medical clinic",
            description:
                '''O'zbekiston temir yo'llari" AJ Sog'liqni saqlash xizmati''',
          ),
          getSearchTypingItemsLong(
            image: AppImages.TEMIR_YOL,
            title: "Markaziy temir yo'l\npoliklinikasi",
            subtitle: "Medical clinic",
            description:
                '''O'zbekiston temir yo'llari" AJ Sog'liqni saqlash xizmati''',
          ),
          getSearchTypingItemsLong(
            image: AppImages.TEMIR_YOL,
            title: "Markaziy temir yo'l\npoliklinikasi",
            subtitle: "Medical clinic",
            description:
                '''O'zbekiston temir yo'llari" AJ Sog'liqni saqlash xizmati''',
          ),
          getViewButton("Organizations"),
          getMainText(mainText: "People"),
          getSearchTypingItemsLong(
            image: AppImages.DIYORJON,
            title: "Eshdavlatov Umidjon",
            subtitle: "Dermatologists",
            description: '''Work at MARKAZIY TEMIR YO'L POLIKLINIKASI ''',
          ),
          getSearchTypingItemsLong(
            image: AppImages.DIYORJON,
            title: "Eshdavlatov Umidjon",
            subtitle: "Dermatologists",
            description: '''Work at MARKAZIY TEMIR YO'L POLIKLINIKASI ''',
          ),
          getSearchTypingItemsLong(
            image: AppImages.DIYORJON,
            title: "Eshdavlatov Umidjon",
            subtitle: "Dermatologists",
            description: '''Work at MARKAZIY TEMIR YO'L POLIKLINIKASI ''',
          ),
          getViewButton("People"),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(70),
          ),
        ],
      ),
    );
  }

  Widget getSearchTypingItemsShort({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.calculateBlockVertical(12),
        ),
        ListTile(
          leading: Image.asset(
            image,
            width: SizeConfig.calculateBlockHorizontal(56),
            height: SizeConfig.calculateBlockVertical(56),
            fit: BoxFit.fill,
          ),
          title: Padding(
            padding: EdgeInsets.only(
              // left: SizeConfig.calculateBlockHorizontal(15),
              bottom: SizeConfig.calculateBlockVertical(4),
            ),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(16),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(
                // left: SizeConfig.calculateBlockHorizontal(15),
                ),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(14),
                fontWeight: FontWeight.w600,
                color: AppColors.BLACK,
              ),
            ),
          ),
        ),
        Divider(
          indent: SizeConfig.calculateBlockHorizontal(88),
          height: SizeConfig.calculateBlockVertical(12.5),
          endIndent: SizeConfig.calculateBlockHorizontal(16),
        ),
      ],
    );
  }

  getMainText({required String mainText}) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.calculateBlockHorizontal(16),
        top: SizeConfig.calculateBlockVertical(16),
      ),
      child: Text(
        mainText,
        style: TextStyle(
          fontSize: SizeConfig.calculateTextSize(18),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  getViewButton(String view) {
    return TextButton(
      onPressed: () {},
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            "View All $view",
            style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(16),
              fontWeight: FontWeight.w400,
              color: AppColors.SHADOW_BLUE,
            ),
          ),
        ),
      ),
    );
  }

  getSearchTypingItemsLong({
    required String image,
    required String title,
    required String subtitle,
    required String description,
  }) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.calculateBlockVertical(12),
        ),
        ListTile(
          leading: Image.asset(
            image,
            width: SizeConfig.calculateBlockHorizontal(56),
            height: SizeConfig.calculateBlockVertical(56),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.calculateBlockHorizontal(4),
                  ),
                  SvgPicture.asset(
                    AppIcons.LEGAL,
                    width: SizeConfig.calculateBlockHorizontal(16),
                    height: SizeConfig.calculateBlockVertical(16),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(4),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(14),
                  fontWeight: FontWeight.w300,
                  color: AppColors.SHADOW_BLUE,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.calculateBlockHorizontal(8.0),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.MAGISTR,
                      width: SizeConfig.calculateBlockHorizontal(13.94),
                      height: SizeConfig.calculateBlockVertical(11.63),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.calculateBlockHorizontal(4.67),
                        right: SizeConfig.calculateBlockHorizontal(12.67),
                      ),
                      child: Text(
                        "55",
                        style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(10),
                          fontWeight: FontWeight.w600,
                          color: AppColors.ROYAL_ORANGE,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      AppIcons.ORDEN,
                      width: SizeConfig.calculateBlockHorizontal(6.67),
                      height: SizeConfig.calculateBlockVertical(12.98),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.calculateBlockHorizontal(8.67),
                        right: SizeConfig.calculateBlockHorizontal(8.51),
                      ),
                      child: Text(
                        "12",
                        style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(10),
                          fontWeight: FontWeight.w600,
                          color: AppColors.VIOLET_BLUE,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      AppIcons.SHAKE_HAND,
                      width: SizeConfig.calculateBlockHorizontal(14.92),
                      height: SizeConfig.calculateBlockVertical(9.74),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.calculateBlockHorizontal(4.57),
                      ),
                      child: Text(
                        "45",
                        style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(10),
                          fontWeight: FontWeight.w600,
                          color: AppColors.ROYAL_ORANGE,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                description,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(12),
                    fontWeight: FontWeight.w400,
                    color: AppColors.BLACK),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.calculateBlockVertical(12),
                  bottom: SizeConfig.calculateBlockVertical(8),
                ),
                child: Divider(
                  height: SizeConfig.calculateBlockVertical(1),
                  color: AppColors.BLACK.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
