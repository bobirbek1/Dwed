import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class CreateAccountNumberPage extends StatelessWidget {
  CreateAccountNumberPage({Key? key}) : super(key: key);
  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle: "Enter your phone number",
      bodySubtitle:
          "Enter the mobile number where you can be\n reached. You can hide this from your\n profile later",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.createAccountPhoneNumberId,
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
          GetBuilder(
              init: _controller,
              id: _controller.createAccountPhoneNumberId,
              builder: (context) {
                return LoginButton(
                  onPressed: () {
                    if (_controller.validatePhoneNumber()) {
                      Get.toNamed(AppRoutes.CREATE_ACCOUNT_PASSWORD);
                    }
                  },
                  buttonText: "NEXT",
                );
              }),
        ],
      ),
    );
  }
}
