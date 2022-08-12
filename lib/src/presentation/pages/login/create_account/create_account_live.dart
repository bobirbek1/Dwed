import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';



class CreateAccountLive extends StatelessWidget {
  const CreateAccountLive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle: "Where do you live?",
      bodySubtitle:
      "Enter your current residence. You can always change it later.",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              suffixIcon: RotatedBox(
                quarterTurns: 135,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    AppIcons.ARROW_LEFT,
                    color: AppColors.SHADOW_BLUE,
                  ),
                ),
              ),
              labelText: "City/Region",
              labelStyle: const TextStyle(
                color: AppColors.SHADOW_BLUE,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          LoginButton(onPressed: () {
                Get.toNamed(AppRoutes.CREATE_ACCOUNT_NUMBER);
              },
            buttonText: "NEXT",
          ),
        ],
      ),
    );
  }
}