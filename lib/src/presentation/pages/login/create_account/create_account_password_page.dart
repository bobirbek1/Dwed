import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class CreateAccountPasswordPage extends StatelessWidget {
  CreateAccountPasswordPage({Key? key}) : super(key: key);
  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle: "Choose a password",
      bodySubtitle:
          "Create a password with at least 6\n characters. It should be something others\n couldn't guess.",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.createAccountPasswordId,
              builder: (context) {
                return TextField(
                  controller: _controller.passwordController,
                  decoration: InputDecoration(
                    errorText: _controller.passwordError,
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
              id: _controller.createAccountPasswordId,
              builder: (context) {
                return TextField(
                  controller: _controller.confirmPasswordController,
                  decoration: InputDecoration(
                    errorText: _controller.confirmPasswordError,
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
              id: _controller.createAccountPasswordId,
              builder: (context) {
                return LoginButton(
                  onPressed: () {
                    if (_controller.validateCreateAccountPassword()) {
                      _controller.signUp();
                    }
                  },
                  child: _controller.createAccountState ==
                          CreateAccountState.loading
                      ? const CircularProgressIndicator.adaptive()
                      : null,
                  buttonText: _controller.createAccountState !=
                          CreateAccountState.loading
                      ? "NEXT"
                      : null,
                );
              }),
          const SizedBox(
            height: 78,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "By tapping Sign Up, you agree to our ",
                  style: TextStyle(
                    color: AppColors.GRAY_X11,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: "Terms, ",
                  style: TextStyle(
                    color: AppColors.BUTTON_BLUE,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: "Data\n Policy",
                  style: TextStyle(
                    color: AppColors.BUTTON_BLUE,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: " and ",
                  style: TextStyle(
                    color: AppColors.GRAY_X11,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: "Cookies Policy",
                  style: TextStyle(
                    color: AppColors.BUTTON_BLUE,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
