import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class ResetPasswordNewPage extends StatelessWidget {
  ResetPasswordNewPage({Key? key}) : super(key: key);
  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "RESET PASSWORD",
      subtitle: "Connect with yor friends today!",
      bodyTitle: "Choose a new password",
      bodySubtitle:
          "Choose a new password with at least 6\n characters. It should be something others\n couldn't guess",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.resetPasswordPasswordId,
              builder: (context) {
                return TextField(
                  controller: _controller.passwordResetPasswordController,
                  decoration: InputDecoration(
                    errorText: _controller.passwordResetError,
                    labelText: "New Password",
                    labelStyle: const TextStyle(
                      color: AppColors.SHADOW_BLUE,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 16,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.resetPasswordPasswordId,
              builder: (context) {
                return TextField(
                  controller: _controller.confirmPasswordController,
                  decoration: InputDecoration(
                    errorText: _controller.confirmResetError,
                    labelText: "Confirm New Password",
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
              id: _controller.resetPasswordPasswordId,
              builder: (context) {
                return LoginButton(
                  onPressed: () {
                    if (_controller.validateResetPassword()) {
                      Get.toNamed(AppRoutes.LOGIN);
                    }
                  },
                  buttonText: "CONTINUE",
                );
              }),
        ],
      ),
    );
  }
}
