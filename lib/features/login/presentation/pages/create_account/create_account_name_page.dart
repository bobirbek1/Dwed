import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';


class CreateAccountNamePage extends StatelessWidget {
  const CreateAccountNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle:  "What's your name?",
      bodySubtitle: "Enter the full name you use in real life",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          textField("Name"),
          const SizedBox(
            height: 24,
          ),
          textField("Surname"),
          const SizedBox(
            height: 24,
          ),
          textField("Additional name"),
          const SizedBox(
            height: 32,
          ),
        const LoginButton(buttonText: "NEXT",),
        ],
      ),
    );
  }

  Widget textField(String labelText) {
    return TextField(
      decoration: InputDecoration(
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
