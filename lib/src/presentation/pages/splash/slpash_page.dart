import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/splash/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  final _controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.BUTTON_BLUE,
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
            child: FittedBox(
              child: Text(
                "DWED",
                style: TextStyle(
                  fontSize: 95,
                  color: AppColors.WHITE,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
