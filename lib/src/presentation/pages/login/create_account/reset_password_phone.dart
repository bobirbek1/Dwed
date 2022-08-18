import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class ResetPasswordPhonePage extends StatelessWidget {
  ResetPasswordPhonePage({Key? key}) : super(key: key);
  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "RESET PASSWORD",
      subtitle: "Reset password in two quick steps",
      bodyTitle: "Enter your phone number",
      bodySubtitle:
          "Enter your phone number and we'll send\n you the 6-digit confirmation code to get\n back into your account",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.phoneNumberId,
              builder: (context) {
                return TextField(
                  controller: _controller.phoneNumberController,
                  decoration: InputDecoration(
                    errorText: _controller.phoneNumberError,
                    labelText: "Phone Number",
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
          LoginButton(
            onPressed: () {
              if (_controller.validatePhoneNumber()) {
                Get.toNamed(AppRoutes.RESET_PASSWORD_VERIFY);
              }
            },
            buttonText: "RESET",
          ),
        ],
      ),
    );
  }
}
