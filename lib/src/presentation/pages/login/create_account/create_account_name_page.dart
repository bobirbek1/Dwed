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
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle: "What's your name?",
      bodySubtitle: "Enter the full name you use in real life",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.createAccountNameId,
              builder: (context) {
                return textField(
                  "Name",
                  _controller.nameController,
                  _controller.nameError,
                );
              }),
          const SizedBox(
            height: 24,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.createAccountNameId,
              builder: (context) {
                return textField(
                  "Surname",
                  _controller.surnameController,
                  _controller.surnameError,
                );
              }),
          const SizedBox(
            height: 24,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.createAccountNameId,
              builder: (context) {
                return textField(
                  "Username",
                  _controller.usernameController,
                  _controller.userNameError,
                );
              }),
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              id: _controller.createAccountNameId,
              init: _controller,
              builder: (context) {
                return LoginButton(
                  onPressed: () {
                    if (_controller.validateCreateAccountName()) {
                      Get.toNamed(AppRoutes.CREATE_ACCOUNT_DATE);
                    }
                  },
                 buttonText: "NEXT",
                );
              }),
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
