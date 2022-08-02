
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.BUTTON_BLUE,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.LOGO,
            width: 150,
            color: AppColors.WHITE,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 65.0, left: 65.0),
            child: Text(
              "DWED",
              style: TextStyle(
                fontSize: 95,
                color: AppColors.WHITE,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}