import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
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
  int _radioValue = 0;
  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "akkount_yaratish".tr,
      subtitle: "bugun_dostlaringiz_bilan_boglaning".tr,
      bodyTitle: "sizning_jinsingiz".tr,
      bodySubtitle:
          "sizning_jinsingizni_kim_korishini_profilingizda_sozlashingiz_mumkin".tr,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          getRadio(list[0], 0),
          getRadio(list[1], 1),
          const SizedBox(
            height: 32,
          ),
          LoginButton(
            onPressed: () {
              Get.toNamed(AppRoutes.CREATE_ACCOUNT_SPECIALITY);
            },
            buttonText: "keyingisi".tr,
          ),
        ],
      ),
    );
  }

  List<String> list = [
    "erkak".tr,
    "ayol".tr,
  ];

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
              setState(() {
                _radioValue = val as int;
                _controller.gender = list[_radioValue];
              });
            },
            activeColor: AppColors.MAXSIMUM_BLUE_GREEN,
          ),
        ),
      ],
    );
  }
}
