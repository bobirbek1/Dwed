import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';

class ResetPasswordNewPage extends StatelessWidget {
  const ResetPasswordNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "RESET PASSWORD",
      subtitle: "Connect with yor friends today!",
      bodyTitle: "Choose a new password",
      bodySubtitle:
          "Choose a new password with at least 6\n characters. It should be something others\n couldn't guess",
      child: Column(
        children:  [
          SizedBox(
            height: 32,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "New Password",
              labelStyle: TextStyle(
                color: AppColors.SHADOW_BLUE,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Confirm New Password",
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
            onPressed: (){},
            buttonText: "CONTINUE",
          ),
        ],
      ),
    );
  }
}
