import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app/app_colors.dart';
import '../../../../../app/app_icons.dart';
import '../../../../../core/utils/size_config.dart';
import '../../widgets/login_button.dart';
import '../../widgets/login_page_skeleton.dart';

class CreateAccountLive extends StatelessWidget {
  const CreateAccountLive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle: "Where do you live?",
      bodySubtitle:
      "Enter your current residence. You can always change it later.",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              suffixIcon: RotatedBox(
                quarterTurns: 135,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    AppIcons.ARROW_LEFT,
                    color: AppColors.SHADOW_BLUE,
                  ),
                ),
              ),
              labelText: "City/Region",
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