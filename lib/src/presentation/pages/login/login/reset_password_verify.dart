import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/controller/login/login_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/create_account/verification_code_input.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class ResetPasswordVerifyPage extends StatefulWidget {
  ResetPasswordVerifyPage({Key? key}) : super(key: key);
  final _controller = Get.find<LoginController>();
  final String? smsCode="";

  @override
  State<ResetPasswordVerifyPage> createState() =>
      _ResetPasswordVerifyPageState();
}

class _ResetPasswordVerifyPageState extends State<ResetPasswordVerifyPage> {
  @override
  Widget build(BuildContext context) {
    String _onCompleted = "";
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "maxfiy_sonni_tiklash".tr,
      subtitle: "bugun_dostlaringiz_bilan_boglaning".tr,
      bodyTitle: "telefon_raqamni_tasdiqlash".tr,
      bodySubtitle:
          "biz_sizga_SMS_orqali_yuborgan_6_xonali_tasdiqlash_kodini_kiriting".tr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: getNumberText()),
          GetBuilder(
            init: widget._controller,
            id: widget._controller.smsCodeId,
            builder: (context) {
              return LoginButton(
                onPressed: () {
                  print(widget.smsCode);
                  Get.log(widget.smsCode!);
                  if (widget.smsCode!.length == 6) {
                    // widget._controller.smsCodeResetController.text=widget.smsCode!;
                    // if (widget._controller.validateSmsCode()) {
                      Get.toNamed(AppRoutes.RESET_PASSWORD_NEW);
                      Get.log(widget.smsCode!);
                    // }
                  }
                },
                buttonText: "tasdiqlash".tr,
              );
            }
          ),
          const SizedBox(
            height: 32,
          ),
           Text(
            "maxfiy_sonni_qayta_sorash_soniyadan_song".tr+"\n01:20" ,
            style: const TextStyle(
              color: AppColors.GRAY_X11,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  getNumberText() {
    String _onCompleted = "";
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32,
      ),
      child: VerificationCodeInput(
        keyboardType: TextInputType.number,
        length: 6,
        itemSize: 48,
        forceUpperCase: false,
        autofocus: false,
        onCompleted: (String value) {
          print(value);
          setState(() {
            _onCompleted = value;
            widget.smsCode!=value;
          });
        },
      ),
    );
  }


}

