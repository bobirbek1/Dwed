import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/overlays/overlays.dart';
import 'package:flutter_template/src/data/model/country_model.dart';
import 'package:flutter_template/src/data/model/region_model.dart';
import 'package:flutter_template/src/presentation/controller/create_account/create_account_controller.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_button.dart';
import 'package:flutter_template/src/presentation/widgets/login/login_page_skeleton.dart';
import 'package:get/get.dart';

class CreateAccountAddress extends StatelessWidget {
  CreateAccountAddress({Key? key}) : super(key: key);

  final _controller = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
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
          GestureDetector(
            onTap: () => showRegionModal(),
            child: TextField(
              enabled: false,
              controller: _controller.regionController,
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
          ),
          const SizedBox(
            height: 32,
          ),
          LoginButton(
            onPressed: () {
              Get.toNamed(AppRoutes.CREATE_ACCOUNT_NUMBER);
            },
            buttonText: "NEXT",
          ),
        ],
      ),
    );
  }

  showRegionModal() {
    bool isCountry = true;
    _controller.getCountryList();
    showBottomSheetDialog(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Text(
              "Select region",
              style: TextStyle(
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
                id: _controller.regionId,
                builder: (context) {
                  switch (_controller.regionState) {
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
                            final data = isCountry
                                ? _controller.countryList[index]
                                : _controller.regionList[index];
                            return isCountry
                                ? getCountryItem(
                                    data as Country,
                                    () {
                                      isCountry = false;
                                      _controller.getRegionList(data.id ?? 0);
                                    },
                                  )
                                : getRadio(
                                    (data as Region).name ?? "",
                                    index,
                                    _controller.regionValue,
                                    (val) {
                                      _controller.selectedRegion =
                                          _controller.regionList[val];
                                      _controller.changeRegionValue(val);
                                    },
                                  );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: AppColors.BLACK.withOpacity(0.1),
                              thickness: 1,
                            );
                          },
                          itemCount: isCountry
                              ? _controller.countryList.length
                              : _controller.regionList.length,
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
                id: _controller.regionId,
                builder: (ctrl) {
                  return isCountry
                      ? const SizedBox()
                      : Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                  _controller.selectRegion();
                                },
                                child: const Text(
                                  "Select",
                                  style: TextStyle(
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
                              height: 16,
                            ),
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
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  getCountryItem(Country sector, onPressed) {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Radio(
          value: index,
          groupValue: value,
          onChanged: onChanged,
          activeColor: AppColors.MAXSIMUM_BLUE_GREEN,
        ),
      ],
    );
  }
}
