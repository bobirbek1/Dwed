import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

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
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Connect with your friends today!",
      bodyTitle: "What's your gender?",
      bodySubtitle:
          "You can change who sees your gender on\n your profile later",
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          getRadio( list[0],0),
          getRadio( list[1],1),
          getRadio( list[2],2),
          const SizedBox(
            height: 32,
          ),
          LoginButton(onPressed: () {
                Get.toNamed(AppRoutes.CREATE_ACCOUNT_SPECIALITY);
              },buttonText: "NEXT",),
        ],
      ),
    );
  }
  List<String> list=["Male","Female","Prefer not to say",];

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
            value: index-1,
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
