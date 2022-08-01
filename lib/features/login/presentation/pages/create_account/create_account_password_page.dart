import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';

class CreateAccountPasswordPage extends StatelessWidget {
  const CreateAccountPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle: "Choose a password",
      bodySubtitle:
          "Create a password with at least 6\n characters. It should be something others\n couldn't guess.",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "New Password",
              labelStyle: TextStyle(
                color: AppColors.SHADOW_BLUE,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Confirm New Password",
              labelStyle: TextStyle(
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
            buttonText: "SIGN UP",
          ),
          const SizedBox(
            height: 78,
          ),
          getTextSpan('By tapping Sign Up, you agree to our',
              Colors.grey.withOpacity(0.7)),
          GestureDetector(
            onTap: () {},
            child: getTextSpan(
              'Terms,',
              Colors.blue.withOpacity(0.7),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: getTextSpan(
              'Data Policy ',
              Colors.blue.withOpacity(0.7),
            ),
          ),
          getTextSpan(
            'and ',
            Colors.grey.withOpacity(0.7),
          ),
          GestureDetector(
            onTap: () {},
            child: getTextSpan(
              'Cookies Policy',
              Colors.blue.withOpacity(0.7),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  Widget getTextSpan(String text, Color color) {
    return RichText(
      // overflow: TextOverflow.clip,
      // textAlign: TextAlign.end,
      // textDirection: TextDirection.ltr,
      // maxLines: 1,
      // softWrap: true,
      // textScaleFactor: 1,
      text: TextSpan(
        text: text,
        children: [
          TextSpan(
            
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
