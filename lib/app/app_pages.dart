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
import 'package:flutter_template/src/presentation/pages/quiz/connection_error_page.dart';
import 'package:flutter_template/src/presentation/pages/quiz/create_questions.dart';
import 'package:flutter_template/src/presentation/pages/quiz/create_quiz.dart';
import 'package:flutter_template/src/presentation/pages/quiz/create_quiz_image_on_the_top.dart';
import 'package:flutter_template/src/presentation/pages/quiz/create_variants.dart';
import 'package:flutter_template/src/presentation/pages/quiz/game_not_found.dart';
import 'package:flutter_template/src/presentation/pages/quiz/my_profile.dart';
import 'package:flutter_template/src/presentation/pages/quiz/no_quiz.dart';
import 'package:flutter_template/src/presentation/pages/quiz/overall_result.dart';
import 'package:flutter_template/src/presentation/pages/quiz/player_informatin.dart';
import 'package:flutter_template/src/presentation/pages/quiz/questioning.dart';
import 'package:flutter_template/src/presentation/pages/quiz/requirments.dart';
import 'package:flutter_template/src/presentation/pages/quiz/result.dart';
import 'package:flutter_template/src/presentation/pages/quiz/sign_inf_for_test_page.dart';
import 'package:flutter_template/src/presentation/pages/quiz/time_finished.dart';
import 'package:flutter_template/src/presentation/pages/quiz/total_results.dart';
import 'package:flutter_template/src/presentation/pages/quiz/user_quizzes_page.dart';
import 'package:flutter_template/src/presentation/pages/search/offers/offers_page.dart';
import 'package:flutter_template/src/presentation/pages/search/offers/offers_sub_cat_page.dart';
import 'package:flutter_template/src/presentation/pages/search/offers/offers_sub_sub_cat_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_organizations/organizations_sub_details_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_organizations/organizations_sub_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_organizations/user_post_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_people/people_sub_details_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_people/people_sub_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_streams/streams_sub_details_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_streams/streams_sub_page.dart';
import 'package:flutter_template/src/presentation/pages/search/offers/offer_details_page.dart';
import 'package:flutter_template/src/presentation/pages/splash/on_boarding_page.dart';
import 'package:flutter_template/src/presentation/pages/splash/slpash_page.dart';
import 'package:flutter_template/src/presentation/pages/stream/stream_detail_page.dart';
import 'package:flutter_template/src/presentation/quiz_stream_page.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_template/app/app_routes.dart';

class AppPages {
  static final getPages = [
    GetPage(name: AppRoutes.SPLASH, page: () => SplashPage()),
    // GetPage(
    //     name: AppRoutes.ON_BOARDING_LANG,
    //     page: () => const OnBoardingLangPage()),
    GetPage(name: AppRoutes.ON_BOARDING, page: () => const OnBoardingPage()),
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
    GetPage(name: AppRoutes.OFFERS_SUB_PAGE, page: () => OffersSubCatPage()),
    GetPage(
        name: AppRoutes.OFFERS_SUB_SUB_PAGE, page: () => OffersSubSubCatPage()),

    GetPage(
        name: AppRoutes.ORGANIZATIONS_SUB_PAGE,
        page: () => OrganizationsSubPage()),
    GetPage(name: AppRoutes.STREAMS_SUB_PAGE, page: () => StreamsSubPage()),
    GetPage(name: AppRoutes.PEOPLE_SUB_PAGE, page: () => PeopleSubPage()),
    GetPage(name: AppRoutes.OFFERS_SUB_DETAILS_PAGE, page: () => OffersPage()),
    GetPage(
        name: AppRoutes.ORGANIZATIONS_SUB_DETAILS_PAGE,
        page: () => OrganizationsSubDetailsPage()),
    GetPage(
        name: AppRoutes.STREAMS_SUB_DETAILS_PAGE,
        page: () => StreamsSubDetailsPage()),
    GetPage(
        name: AppRoutes.PEOPLES_SUB_DETAILS_PAGE,
        page: () => PeoplesSubDetailsPage()),
    GetPage(name: AppRoutes.USER_POST_PAGE, page: () => UserPostPage()),
    GetPage(name: AppRoutes.ITEM_DETAILS_PAGE, page: () => OfferDetailsPage()),
    GetPage(name: AppRoutes.BOTTOM_BAR_VIEW, page: () => const BottomBarView()),
    GetPage(name: AppRoutes.CARTPAGE, page: () =>  CartPage()),
    GetPage(name: AppRoutes.CHECKOUTPAGE, page: () =>  CheckoutPage()),
    GetPage(name: AppRoutes.PAYMENTMETHOD, page: () =>  MethodFirst()),
    GetPage(name: AppRoutes.CHECKOUTORDEREDPAGE, page: () =>  CheckoutOrdered()),
    GetPage(name: AppRoutes.INFORMATIONPAGE, page: () =>  InformationPage()),
    GetPage(name: AppRoutes.STREAM_DETAIL_PAGE, page: () =>  StreamDetailsPage()),
    GetPage(name: AppRoutes.CONNECTION_ERROR_PAGE, page: () =>  ConnectionErrorPage()),
    GetPage(name: AppRoutes.MY_PROFILE, page: () =>  MyProfilePage()),
    GetPage(name: AppRoutes.RESET_PASSWORD_FOUR, page: () =>  SignInForTestPage()),
    GetPage(name: AppRoutes.SIGN_IN_FOR_TEST_PAGE, page: () =>  SignInForTestPage()),
    GetPage(name: AppRoutes.QUESTIONING_PAGE, page: () =>  QuestioningPage()),
    GetPage(name: AppRoutes.CREATE_QUIZ, page: () =>  CreateQuiz()),
    GetPage(name: AppRoutes.CREATE_VARIANTS, page: () =>  CreateVariants()),
    GetPage(name: AppRoutes.RESULT, page: () =>  ResultPage()),
    GetPage(name: AppRoutes.OVERALL_RESULT, page: () =>  OverallResult()),
    GetPage(name: AppRoutes.TOTAL_RESULTS, page: () =>  TotalResults()),
    GetPage(name: AppRoutes.NO_QUIZ, page: () =>  NoQuizPage()),
    GetPage(name: AppRoutes.GAME_NOT_FOUND, page: () =>  GameNotFoundPage()),
    GetPage(name: AppRoutes.PLAYER_INFORMATION, page: () =>  PlayerInformationPage()),
    GetPage(name: AppRoutes.REQUIRMENTS_QUIZ, page: () =>  RequirmentsPage()),
    GetPage(name: AppRoutes.CREATE_QUIZ_IMAGE_ON_TOP, page: () =>  CreateQuizImageOnTheTop()),
    GetPage(name: AppRoutes.QUIZ_TIME_FINISHED, page: () =>  TimeFinishedPage()),
    GetPage(name: AppRoutes.QUIZ_STREAM, page: () =>  QuizStreamPage()),
    GetPage(name: AppRoutes.USER_QUIZZES_PAGE, page: () =>  UserQuizzesPage()),
    GetPage(name: AppRoutes.CREATE_QUESTION_PAGE, page: () =>  CreateQuestionsPage()),


  ];
}
