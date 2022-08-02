import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';

class CreateAccountLoginPage extends StatelessWidget {
  const CreateAccountLoginPage({Key? key}) : super(key: key);

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
          SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Login or phone number",
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
                    border: Border.all(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "Remember me",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password!",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          LoginButton(
            buttonText: "LOG IN",
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: Row(
              children: [
                Container(
                  width: 136,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                Text(
                  "  OR  ",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 12,
                  ),
                ),
                Container(
                  width: 136,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black),
                primary: Colors.white,
                onPrimary: Colors.black,
                fixedSize: const Size.fromHeight(
                  56,
                ),
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    6,
                  ),
                ),
              ),
              child: Text(
                "CREATE NEW DWED ACCOUNT",
                style: const TextStyle(
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
