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
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "akkount_yaratish".tr,
      subtitle: "bugun_dostlaringiz_bilan_boglaning".tr,
      bodyTitle: "maxfiy_son_yarating".tr,
      bodySubtitle: "8_ta_belgidan_kam_bolmagan_maxfiy_son_yarating".tr,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.passwordId,
              builder: (context) {
                return TextField(
                  obscureText: true,
                  controller: _controller.passwordController,
                  decoration: InputDecoration(
                    errorText: _controller.passwordError,
                    labelText: "yangi_maxfiy_son".tr,
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
              id: _controller.passwordId,
              builder: (context) {
                return TextField(
                  obscureText: true,
                  controller: _controller.confirmPasswordController,
                  decoration: InputDecoration(
                    errorText: _controller.confirmPasswordError,
                    labelText: "yangi_maxfiy_sonni_takrorlang".tr,
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
              id: _controller.passwordId,
              builder: (context) {
                return LoginButton(
                  onPressed: () {
                    if (_controller.validatePassword()) {
                      _controller.signUp();
                    }
                  },
                  child: _controller.createAccountState ==
                          CreateAccountState.loading
                      ? const CircularProgressIndicator.adaptive()
                      : null,
                  buttonText: _controller.createAccountState !=
                          CreateAccountState.loading
                      ? "keyingisi".tr
                      : null,
                );
              }),
          const SizedBox(
            height: 78,
          ),
          RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              children: [
                TextSpan(
                  text:
                      "royxatdan_otish_tugmasini_bosish_orqali_siz_bizning_shartlarimizga_malumotlar_siyosati_va_cookie_fayllari_siyosatiga_rozilik_bildirasiz"
                          .tr,
                  style: const TextStyle(
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
