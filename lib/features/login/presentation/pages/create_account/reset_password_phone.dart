import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';

class ResetPasswordPhonePage extends StatelessWidget {
  const ResetPasswordPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "RESET PASSWORD",
      subtitle: "Reset password in two quick steps",
      bodyTitle: "Enter your phone number",
      bodySubtitle:
          "Enter your phone number and we'll send\n you the 6-digit confirmation code to get\n back into your account",
      child: Column(
        children: const [
          SizedBox(
            height: 32,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Phone Number",
              labelStyle: TextStyle(
                color: AppColors.SHADOW_BLUE,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          LoginButton(
            buttonText: "RESET",
          ),
        ],
      ),
    );
  }
}
