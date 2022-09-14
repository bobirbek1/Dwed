import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class CreateAccountNumberPage extends StatelessWidget {
  CreateAccountNumberPage({Key? key}) : super(key: key);
  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "akkount_yaratish",
      subtitle: "bugun_dostlaringiz_bilan_boglaning".tr,
      bodyTitle: "telefon_raqamni_kiriting".tr,
      bodySubtitle:
          "akkauntni_faollashtirish_uchun_mobil_raqamni_kiriting".tr,
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
          GetBuilder(
              init: _controller,
              id: _controller.phoneNumberId,
              builder: (context) {
                return LoginButton(
                  onPressed: () {
                    if (_controller.validatePhoneNumber()) {
                      Get.toNamed(AppRoutes.CREATE_ACCOUNT_VERIFY);
                    }
                  },
                  buttonText: "keyingisi".tr,
                );
              }),
        ],
      ),
    );
  }
}
