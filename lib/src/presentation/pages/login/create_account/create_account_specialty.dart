import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/overlays/overlays.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/data/model/others/sector_model.dart';
import 'package:flutter_template/src/data/model/others/specialty_model.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class CreateAccountSpecialty extends StatelessWidget {
  CreateAccountSpecialty({Key? key}) : super(key: key);

  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "akkount_yaratish".tr,
      subtitle: "bugun_dostlaringiz_bilan_boglaning".tr,
      bodyTitle: "kasbingiz?".tr,
      bodySubtitle: "keyinchalik_profilizda_sozlashingiz_mumkin".tr,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () => showSpecialityModal(),
            child: TextField(
              enabled: false,
              controller: _controller.specialtyController,
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
                labelText: "kasbingiz".tr,
                labelStyle: const TextStyle(
                  color: AppColors.SHADOW_BLUE,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          LoginButton(
            onPressed: () {
              if (_controller.validateCreateAccountSpecialty()) {
                Get.toNamed(AppRoutes.CREATE_ACCOUNT_LIVE);
              } else {
                showSnackbar(_controller.specialtyError!);
              }
            },
            buttonText: "keyingisi".tr,
          ),
        ],
      ),
    );
  }

  showSpecialityModal() {
    bool isSector = true;
    _controller.getSectorList();
    showBottomSheetDialog(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              "kasb_tanlash".tr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.BLACK,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            getSearchBox(),
            GetBuilder(
                init: _controller,
                id: _controller.specialityId,
                builder: (context) {
                  switch (_controller.specialityState) {
                    case CreateAccountState.loading:
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    case CreateAccountState.loaded:
                      return Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          itemBuilder: (context, index) {
                            final data = isSector
                                ? _controller.sectorList[index]
                                : _controller.specialityList[index];
                            return isSector
                                ? getSectorItem(
                                    data as Sector,
                                    () {
                                      isSector = false;
                                      _controller
                                          .getSpecialityList(data.slug ?? "");
                                    },
                                  )
                                : getRadio(
                                    (data as Speciality).name ?? "",
                                    index,
                                    _controller.specialityValue,
                                    (val) {
                                      _controller.selectedSpec =
                                          _controller.specialityList[val];
                                      _controller.changeSpecilityValue(val);
                                    },
                                  );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: AppColors.BLACK.withOpacity(0.1),
                              thickness: 1,
                            );
                          },
                          itemCount: isSector
                              ? _controller.sectorList.length
                              : _controller.specialityList.length,
                        ),
                      );
                    default:
                      return const Expanded(
                        child: Center(
                          child: Text(
                            "Kutilmagan xatolik yuz berdi!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.BLACK,
                            ),
                          ),
                        ),
                      );
                  }
                }),
            GetBuilder(
                init: _controller,
                id: _controller.specialityId,
                builder: (ctrl) {
                  return isSector
                      ? const SizedBox()
                      : Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                  _controller.selectSpeciality();
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
                            const SizedBox(height: 16),
                          ],
                        );
                }),
          ],
        ),
      ),
    );
  }

  getSearchBox() {
    return Container(
      height: 36,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: AppColors.ANTI_FLASH_WHITE,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: TextEditingController(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: AppColors.BLACK,
        ),
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: AppColors.GRAY_X11,
          ),
          hintText: "qidirish".tr,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  getSectorItem(Sector sector, onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                sector.name ?? "- - - -",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.BLACK,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            RotatedBox(
              quarterTurns: 90,
              child: SvgPicture.asset(
                AppIcons.ARROW_LEFT,
                color: AppColors.BLACK,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget getRadio(String text, int index, int? value, onChanged) {
    return RadioListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
      value: index,
      groupValue: value,
      onChanged: onChanged,
      activeColor: AppColors.MAXSIMUM_BLUE_GREEN,
    );
  }
}
