import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: false,
      headerHeight: 254,
      bodyTitle: "WELCOME BACK!\u{1F44B}",
      bodySubtitle: "Hello again, you’ve been missed!",
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Login or phone number",
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
              labelText: "Password",
              labelStyle: TextStyle(
                color: AppColors.SHADOW_BLUE,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.BLACK),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "Remember me",
                    style: TextStyle(
                      color: AppColors.BLACK.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password!",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const LoginButton(
            buttonText: "LOG IN",
          ),
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
                  "OR",
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
              onPressed: () {},
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
              child: const Text(
                "CREATE NEW DWED ACCOUNT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
