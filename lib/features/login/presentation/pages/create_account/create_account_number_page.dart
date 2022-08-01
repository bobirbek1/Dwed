import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';

class CreateAccountNumberPage extends StatelessWidget {
  const CreateAccountNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle: "Enter your phone number",
      bodySubtitle:
          "Enter the mobile number where you can be\n reached. You can hide this from your\n profile later",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              labelText: "Phone Number",
              labelStyle: const TextStyle(
                color: AppColors.SHADOW_BLUE,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const LoginButton(
            buttonText: "NEXT",
          ),
        ],
      ),
    );
  }
}
