import 'package:flutter_template/app/app_routes.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController {
  void quizPressed() {
    Get.toNamed(AppRoutes.USER_QUIZZES_PAGE);
  }

}