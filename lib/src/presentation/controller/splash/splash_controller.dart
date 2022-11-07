import 'package:flutter_template/app/app_constants.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _checkToken();
    super.onInit();
  }

  void _checkToken() async {
    final prefs = Get.find<SharedPreferences>();
    final token = prefs.getString(keyToken);
    Get.log("splash: token is $token");
    await Future.delayed(
      const Duration(
        milliseconds: 2000,
      ),
    );
    if (token != null) {
      Get.toNamed(AppRoutes.BOTTOM_BAR_VIEW);
    } else {
      Get.toNamed(AppRoutes.LOGIN);
    }
  }
}
