import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/login/login_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: false,
      headerHeight: 254,
      bodyTitle: "WELCOME BACK!\u{1F44B}",
      bodySubtitle: "Hello again, you’ve been missed!",
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.loginId,
              builder: (context) {
                return TextField(
                  controller: _controller.userNameController,
                  decoration: InputDecoration(
                    errorText: _controller.userNameError,
                    labelText: "Login or phone number",
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
              id: _controller.loginId,
              builder: (context) {
                return TextField(
                  controller: _controller.passwordController,
                  decoration: InputDecoration(
                    errorText: _controller.passwordError,
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      color: AppColors.SHADOW_BLUE,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                GetBuilder(
                    init: _controller,
                    id: _controller.checkBoxId,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          _controller.toggleCheckBox();
                        },
                        child: Container(
                          width: 16,
                          height: 16,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: _controller.rememberMe
                                ? null
                                : Border.all(color: AppColors.BLACK),
                            color: _controller.rememberMe
                                ? AppColors.BUTTON_BLUE
                                : null,
                          ),
                          child: _controller.rememberMe
                              ? const Icon(
                                  Icons.check,
                                  color: AppColors.WHITE,
                                  size: 12,
                                )
                              : null,
                        ),
                      );
                    }),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "Remember me",
                    style: TextStyle(
                      color: AppColors.BLACK.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.RESET_PASSWORD_PHONE);
                  },
                  child: const Text(
                    "Forgot password!",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          GetBuilder(
              init: _controller,
              id: _controller.loginId,
              builder: (ctrl) {
                print(
                    "login page ${_controller.loginState != LoginState.loading}");
                return LoginButton(
                  onPressed: () {
                    _controller.signIn();
                  },
                  child: _controller.loginState == LoginState.loading
                      ? const CircularProgressIndicator.adaptive()
                      : null,
                  buttonText: _controller.loginState != LoginState.loading
                      ? "LOG IN"
                      : null,
                );
              }),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: AppColors.BLACK.withOpacity(0.4),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "OR",
                  style: TextStyle(
                    color: AppColors.BLACK.withOpacity(0.4),
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: AppColors.BLACK.withOpacity(0.4),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.CREATE_ACCOUNT_NAME);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.BLACK),
                primary: AppColors.BLACK,
                fixedSize: const Size.fromHeight(
                  56,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    6,
                  ),
                ),
              ),
              child: const Text(
                "CREATE NEW DWED ACCOUNT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
