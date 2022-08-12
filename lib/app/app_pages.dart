import 'package:flutter_template/src/presentation/pages/login/create_account/creat_account_date_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_gender_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_live.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_name_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_number_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_password_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_specialty.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/reset_password_new.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/reset_password_phone.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/reset_password_verify.dart';
import 'package:flutter_template/src/presentation/pages/login/login_page.dart';
import 'package:flutter_template/src/presentation/pages/splash/on_boarding_page.dart';
import 'package:flutter_template/src/presentation/pages/splash/slpash_page.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_template/app/app_routes.dart';

class AppPages {
  static final getPages = [
    GetPage(name: AppRoutes.SPLASH, page: () => const SplashPage()),
    // GetPage(
    //     name: AppRoutes.ON_BOARDING_LANG,
    //     page: () => const OnBoardingLangPage()),
    GetPage(name: AppRoutes.ON_BOARDING, page: () => OnBoardingPage()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
    GetPage(
        name: AppRoutes.CREATE_ACCOUNT_NAME,
        page: () => CreateAccountNamePage()),
    GetPage(
        name: AppRoutes.CREATE_ACCOUNT_DATE,
        page: () => CreateAccountDatePage()),
    GetPage(
        name: AppRoutes.CREATE_ACCOUNT_GENDER,
        page: () => CreateAccountGenderPage()),
    GetPage(
        name: AppRoutes.CREATE_ACCOUNT_SPECIALITY,
        page: () => CreateAccountSpecialty()),
    GetPage(
        name: AppRoutes.CREATE_ACCOUNT_LIVE,
        page: () => const CreateAccountLive()),
    GetPage(
        name: AppRoutes.CREATE_ACCOUNT_NUMBER,
        page: () => CreateAccountNumberPage()),
    GetPage(
        name: AppRoutes.CREATE_ACCOUNT_PASSWORD,
        page: () => CreateAccountPasswordPage()),
    GetPage(
        name: AppRoutes.RESET_PASSWORD_PHONE,
        page: () => ResetPasswordPhonePage()),
    GetPage(
        name: AppRoutes.RESET_PASSWORD_VERIFY,
        page: () => ResetPasswordVerifyPage()),
    GetPage(
        name: AppRoutes.RESET_PASSWORD_NEW, page: () => ResetPasswordNewPage()),
  ];
}
