import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';

class CreateAccountGenderPage extends StatefulWidget {
  const CreateAccountGenderPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountGenderPage> createState() =>
      _CreateAccountGenderPageState();
}

class _CreateAccountGenderPageState extends State<CreateAccountGenderPage> {
  int _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Enter the full name you use in real life",
      bodyTitle: "What's your gender?",
      bodySubtitle:
          "You can change who sees your gender on\n your profile later",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          getRadio("Male", 1),
          getRadio("Female", 2),
          getRadio("Prefer not to say", 3),
          const SizedBox(
            height: 32,
          ),
         const LoginButton(buttonText: "NEXT",),
        ],
      ),
    );
  }

  Widget getRadio(String text, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        Transform.scale(
          scale: 1.2,
          child: Radio(
            value: index,
            groupValue: _radioValue,
            onChanged: (val) {
              if (val != _radioValue) {
                setState(() {
                  _radioValue = val as int;
                });
              }
            },
            activeColor: AppColors.MAXSIMUM_BLUE_GREEN,
          ),
        ),
      ],
    );
  }
}