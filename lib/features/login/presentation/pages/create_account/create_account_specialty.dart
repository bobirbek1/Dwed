import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';
import 'package:get/get.dart';



class CreateAccountSpecialty extends StatelessWidget {
  const CreateAccountSpecialty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle: "What's your specialty?",
      bodySubtitle:
      "You can change who sees your gender on your profile later.",
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
              labelText: "Specialty",
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
        LoginButton(
            onPressed: () {
                Get.toNamed(AppRoutes.CREATE_ACCOUNT_LIVE);
              },
            buttonText: "NEXT",
          ),
        ],
      ),
    );
  }
}