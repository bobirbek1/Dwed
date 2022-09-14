import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/controller/login/login_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class ResetPasswordNewPage extends StatelessWidget {
  ResetPasswordNewPage({Key? key}) : super(key: key);
  final _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "maxfiy_sonni_tiklash".tr,
      subtitle: "bugun_dostlaringiz_bilan_boglaning".tr,
      bodyTitle: "maxfiy_son_yarating",
      bodySubtitle:
          "8_ta_belgidan_kam_bolmagan_maxfiy_son_yarating".tr,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.resetPasswordId,
              builder: (context) {
                return TextField(
                  obscureText: true,
                  controller: _controller.resetpasswordController,
                  decoration: InputDecoration(
                    errorText: _controller.resetpasswordError,
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
              id: _controller.confirmPasswordController,
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
              id: _controller.resetPasswordId,
              builder: (context) {
                return LoginButton(
                  onPressed: () {
                    if (_controller.validatePassword()) {
                      Get.toNamed(AppRoutes.LOGIN);
                    }
                  },
                  buttonText: "tiklash".tr,
                );
              }),
        ],
      ),
    );
  }
}
