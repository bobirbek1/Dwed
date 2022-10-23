import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.calculateBlockHorizontal(16),
          SizeConfig.calculateBlockVertical(114),
          SizeConfig.calculateBlockHorizontal(16),
          SizeConfig.calculateBlockVertical(157),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.calculateBlockHorizontal(15),
                right: SizeConfig.calculateBlockHorizontal(15),
                bottom: SizeConfig.calculateBlockVertical(24),
              ),
              child: SvgPicture.asset(
                AppIcons.BRO,
                width: SizeConfig.calculateBlockHorizontal(313),
                height: SizeConfig.calculateBlockVertical(310),
              ),
            ),
             Text(
              "No Internet Connection",
              style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(24),
                fontWeight: FontWeight.w500,
              ),
            ),
             Text(
              "Please check your intenet\nconnection and try again",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(16),
                fontWeight: FontWeight.w400,
                color: AppColors.SHADOW_BLUE,
              ),
            ),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(32),
            ),
            Container(
              width: double.infinity,
              height: SizeConfig.calculateBlockVertical(56),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.BUTTON_BLUE,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Try again",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.WHITE,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
