import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/login/login_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class ResetPasswordPhonePage extends StatelessWidget {
  ResetPasswordPhonePage({Key? key}) : super(key: key);
  final _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "maxfiy_sonni_tiklash".tr,
      subtitle: "ikki_bosqichda_maxfiy_sonni_tiklash".tr,
      bodyTitle: "telefon_raqamingizni_kiriting".tr,
      bodySubtitle:
          "telefon_raqamingizni_kiriting_va_akkauntizga_kirish_uchun_6_xonali_tasdiqlash_maxfiy_sonini_yuboramiz".tr,
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
                  keyboardType: TextInputType.phone,
                  controller: _controller.phoneNumberController,
                  decoration: InputDecoration(
                    errorText: _controller.phoneNumberError,
                    labelText: "telefon_raqam".tr,
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
              if (_controller.validateSendPhone()) {
                Get.toNamed(AppRoutes.RESET_PASSWORD_VERIFY);
              }
            },
            buttonText: "tiklash".tr,
          ),
        ],
      ),
    );
  }
}
