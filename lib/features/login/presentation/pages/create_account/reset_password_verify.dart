import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';
import 'package:flutter_template/features/login/presentation/widgets/verification_code_input.dart';
import 'package:get/get.dart';


class ResetPasswordVerifyPage extends StatefulWidget {
  const ResetPasswordVerifyPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordVerifyPage> createState() => _ResetPasswordVerifyPageState();
}

class _ResetPasswordVerifyPageState extends State<ResetPasswordVerifyPage> {
  @override
  Widget build(BuildContext context) {
    String _onCompleted = "";
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "RESET PASSWORD",
      subtitle: "Connect with your friends today!",
      bodyTitle: "Confirm your phone number",
      bodySubtitle:
      "Enter the 6-digit confirmation code that we sent you by SMS.",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
         Padding(padding:const EdgeInsets.symmetric(horizontal: 10),
         child: getNumberText()),
           LoginButton(onPressed: () {
                Get.toNamed(AppRoutes.RESET_PASSWORD_NEW);
              },
            buttonText: "CONFIRM",
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "You can resend confirmation code after\n01:20",
            style: TextStyle(
              color: AppColors.GRAY_X11,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  getNumberText() {
    String _onCompleted = "";
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32,
      ),
      child: VerificationCodeInput(
        keyboardType: TextInputType.number,
        length: 6,
        itemSize: 48,
        forceUpperCase: false,
        autofocus: false,
        onCompleted: (String value) {
          print(value);
          setState(() {
            _onCompleted = value;
          });
        },
      ),
    );
  }
}