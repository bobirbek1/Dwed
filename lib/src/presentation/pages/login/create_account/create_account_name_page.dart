import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class CreateAccountNamePage extends StatelessWidget {
  CreateAccountNamePage({Key? key}) : super(key: key);
  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "akkount_yaratish".tr,
      subtitle: "bugun_dostlaringiz_bilan_boglaning".tr,
      bodyTitle: "sizga_qanday_murojat_qilish_mumkin".tr,
      bodySubtitle: "shaxsiy_sahifangizni_sozlash_uchun_bizga_ozingiz_haqingizda_gapirib_bering".tr,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.nameId,
              builder: (context) {
                return textField(
                  "ism".tr,
                  _controller.nameController,
                  _controller.nameError,
                );
              }),
          const SizedBox(
            height: 24,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.nameId,
              builder: (context) {
                return textField(
                  "familiya".tr,
                  _controller.surnameController,
                  _controller.surnameError,
                );
              }),
          const SizedBox(
            height: 24,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.nameId,
              builder: (context) {
                return textField(
                  "sharif_shart_emas".tr,
                  _controller.usernameController,
                  _controller.userNameError,
                );
              }),
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              id: _controller.nameId,
              init: _controller,
              builder: (context) {
                return LoginButton(
                  onPressed: () {
                    if (_controller.validateCreateAccountName()) {
                      Get.toNamed(AppRoutes.CREATE_ACCOUNT_DATE);
                    }
                  },
                  buttonText: "keyingisi".tr,
                );
              }),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }

  Widget textField(
    String labelText,
    TextEditingController controller,
    String? errorText,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        errorText: errorText,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.GRAY_X11,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
