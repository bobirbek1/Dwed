import 'package:flutter_template/bottom_bar_page.dart';
import 'package:flutter_template/src/presentation/pages/cart/presentation/pages/cart_page.dart';
import 'package:flutter_template/src/presentation/pages/checkout/presentation/pages/checkout_page.dart';
import 'package:flutter_template/src/presentation/pages/checkout_ordered/checkout_ordered_page.dart';
import 'package:flutter_template/src/presentation/pages/checkout_payment_method_1/presentation/pages/checkout_payment_method_1_page.dart';
import 'package:flutter_template/src/presentation/pages/home/home_page.dart';
import 'package:flutter_template/src/presentation/pages/information/information_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/creat_account_date_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_gender_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_address.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_name_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_number_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_password_page.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_specialty.dart';
import 'package:flutter_template/src/presentation/pages/login/create_account/create_account_verify.dart';
import 'package:flutter_template/src/presentation/pages/login/login/reset_password.dart';
import 'package:flutter_template/src/presentation/pages/login/login/reset_password_phone.dart';
import 'package:flutter_template/src/presentation/pages/login/login/login_page.dart';
import 'package:flutter_template/src/presentation/pages/login/login/reset_password_verify.dart';
import 'package:flutter_template/src/presentation/pages/search/search_offers/offers_sub_details_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_offers/offers_sub_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_offers/offers_sub_sub_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_organizations/organizations_sub_details_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_organizations/organizations_sub_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_organizations/user_post_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_people/people_sub_details_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_people/people_sub_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_streams/streams_sub_details_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_streams/streams_sub_page.dart';
import 'package:flutter_template/src/presentation/pages/search/ver_hor_item_details.dart';
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
        page: () => CreateAccountAddress()),
    GetPage(
        name: AppRoutes.CREATE_ACCOUNT_NUMBER,
        page: () => CreateAccountNumberPage()),
    GetPage(
        name: AppRoutes.CREATE_ACCOUNT_VERIFY,
        page: () => CreateAccountVerifyPage()),
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
    GetPage(name: AppRoutes.HOME, page: () => HomePage()),
    GetPage(name: AppRoutes.OFFERS_SUB_PAGE, page: () => OffersSubPage()),
    GetPage(name: AppRoutes.OFFERS_SUB_SUB_PAGE, page: () => OffersSubSubPage()),

    GetPage(
        name: AppRoutes.ORGANIZATIONS_SUB_PAGE,
        page: () => OrganizationsSubPage()),
    GetPage(name: AppRoutes.STREAMS_SUB_PAGE, page: () => StreamsSubPage()),
    GetPage(name: AppRoutes.PEOPLE_SUB_PAGE, page: () => PeopleSubPage()),
    GetPage(
        name: AppRoutes.OFFERS_SUB_DETAILS_PAGE,
        page: () => OffersSubDetailsPage()),
    GetPage(
        name: AppRoutes.ORGANIZATIONS_SUB_DETAILS_PAGE,
        page: () => OrganizationsSubDetailsPage()),
    GetPage(
        name: AppRoutes.STREAMS_SUB_DETAILS_PAGE,
        page: () => StreamsSubDetailsPage()),
    GetPage(
        name: AppRoutes.PEOPLES_SUB_DETAILS_PAGE,
        page: () => PeoplesSubDetailsPage()),
    GetPage(name: AppRoutes.USER_POST_PAGE, page: () =>  UserPostPage()),
          GetPage(
        name: AppRoutes.ITEM_DETAILS_PAGE,
        page: () => const ItemDetailsPage()),
    GetPage(name: AppRoutes.BOTTOM_BAR_VIEW, page: () => const BottomBarView()),
    GetPage(name: AppRoutes.CARTPAGE, page: () =>  CartPage()),
    GetPage(name: AppRoutes.CHECKOUTPAGE, page: () =>  CheckoutPage()),
    GetPage(name: AppRoutes.PAYMENTMETHOD, page: () =>  MethodFirst()),
    GetPage(name: AppRoutes.CHECKOUTORDEREDPAGE, page: () =>  CheckoutOrdered()),
    GetPage(name: AppRoutes.INFORMATIONPAGE, page: () =>  InformationPage()),
  ];
}
