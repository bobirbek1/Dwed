import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/overlays/overlays.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class CreateAccountDatePage extends StatelessWidget {
  CreateAccountDatePage({Key? key}) : super(key: key);
  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "dwedga_kirish".tr,
      subtitle: "bugun_dostlaringiz_bilan_boglaning".tr,
      bodyTitle: "tugilgan_kuningiz_qachon".tr,
      bodySubtitle:
          "yilni_tanlang_keyinchali_doim_yilingizni_korinmaydigan_qila_olasiz"
              .tr,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.birthdayId,
              builder: (context) {
                return GestureDetector(
                  onTap: () => showDatePickerDialog(),
                  child: TextField(
                    controller: _controller.birthdayController,
                    enabled: false,
                    decoration: InputDecoration(
                      errorText: _controller.birthdayError,
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
                      labelText: "kk_oo_yyyy".tr,
                      labelStyle: const TextStyle(
                        color: AppColors.SHADOW_BLUE,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 32,
          ),
          GetBuilder(
              init: _controller,
              id: _controller.birthdayId,
              builder: (context) {
                return LoginButton(
                  onPressed: () {
                    if (_controller.validateCreateAccountBirthday()) {
                      Get.toNamed(AppRoutes.CREATE_ACCOUNT_GENDER);
                    } else {
                      showSnackbar(_controller.birthdayError!);
                    }
                  },
                  buttonText: "keyingisi".tr,
                );
              }),
        ],
      ),
    );
  }

  showDatePickerDialog() {
    DateTime choosenDate = DateTime.now();
    showBottomSheetDialog(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              "sanani_tanlang".tr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.BLACK,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: CupertinoDatePicker(
              maximumYear: DateTime.now().year,
              onDateTimeChanged: (date) {
                choosenDate = date;
              },
              initialDateTime: _controller.birthDate ?? DateTime.now(),
              dateOrder: DatePickerDateOrder.dmy,
              mode: CupertinoDatePickerMode.date,
            )),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 53,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  _controller.selectBirthDate(choosenDate);
                },
                child: Text(
                  "tanlash".tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.WHITE,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.BUTTON_BLUE,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
