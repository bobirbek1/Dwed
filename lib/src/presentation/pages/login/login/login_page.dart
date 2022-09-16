import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/login/login_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = Get.find<LoginController>();
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: false,
      headerHeight: 254,
      bodyTitle: "dwedga_kirish".tr,
      bodySubtitle: "akkauntga_kirish_uchun_avtorizatsiya_qiling".tr,
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
                    labelText: "login_yoki_telefon_raqam".tr,
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
                  obscureText: _isObscure,
                  controller: _controller.passwordController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                    errorText: _controller.passwordError,
                    labelText: "mahfiy_son".tr,
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
                    "meni_eslab_qolish".tr,
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
                  child: Text(
                    "mahfiy_sonni_unutdim".tr,
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
                      ? "kirish".tr
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
                  "yoki".tr,
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
                Get.toNamed(AppRoutes.CREATE_ACCOUNT_NUMBER);
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
              child:  Text(
                "yangi_akkunt_yaratish".tr,
                style: const TextStyle(
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
