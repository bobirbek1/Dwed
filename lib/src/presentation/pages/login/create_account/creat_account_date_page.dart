import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class CreateAccountDatePage extends StatelessWidget {
  CreateAccountDatePage({Key? key}) : super(key: key);
  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle: "When's your birthday?",
      bodySubtitle:
          "Choose your date of birth. You can always\n make this private later",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.birthdayId,
              builder: (context) {
                return TextField(
                  controller: _controller.birthdayController,
                  enabled: false,
                  decoration: InputDecoration(
                    errorText: _controller.birthdayError,
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
                    labelText: "DD/MM/YYY",
                    labelStyle: const TextStyle(
                      color: AppColors.SHADOW_BLUE,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.birthdayId,
              builder: (context) {
                return LoginButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.CREATE_ACCOUNT_GENDER);
                  },
                  buttonText: "NEXT",
                );
              }),
        ],
      ),
    );
  }
}
