import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_category.dart';
import 'package:flutter_template/src/data/model/quiz/quiz_category.dart';
import 'package:flutter_template/src/data/model/quiz/session_data_model.dart';
import 'package:flutter_template/src/domain/repository/quiz/get_quiz_rep.dart';
import 'package:flutter_template/src/domain/usecase/quiz/get/abstract/get_quiz_category_list_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../domain/usecase/quiz/get/abstract/active_sessions_usecase.dart';


class QuizCategoryController extends GetxController {

  ///use case
  final ActiveSessionsUseCase activeSessionsUseCase; //is used only for getting requests to server

  QuizCategoryController({required this.activeSessionsUseCase});

  ///refresh controllers
  RefreshController? sessionPageController; // is used for category page quizzes

  ///ids
  final String sessionPageId = 'SESSION_PAGE_ID'; //is used for category page list view

  @override
  void onInit() {
    sessionPageController = RefreshController(initialRefresh: true);

    super.onInit();
  }

  ///data pressed
  SessionDataModel? sessionPagePressed;

  ///off sets
  int? _catPageOffSet = 0;

  ///is used for quiz category page that is opened when quiz is pressed on the right of the Streams
  List<SessionDataModel> quizSessionList = [];

  ///category page functions
  void onLoadingCatPage() {
    if(_catPageOffSet != null) {
      getQuizSessionList();
    }else {
      sessionPageController!.loadComplete();
      updateSessionPage();
    }
  }
  void onRefreshCatPage() {
    quizSessionList.clear();
    _catPageOffSet = 0;
    getQuizSessionList();
  }
  void onPressCatPage(SessionDataModel data) {
    sessionPagePressed = data;
  }
  void getQuizSessionList() async {
    Get.log("QUIZ_CATEGORY_CONTROLLER  getQuizSessionList => is called");
    final result = await activeSessionsUseCase.getActiveSessions(_catPageOffSet!);
    Get.log("QUIZ_CATEGORY_CONTROLLER  getQuizSessionList DATA => $result");
    result.fold((failure) {
      Get.log("QUIZ_CATEGORY_CONTROLLER  getQuizSessionList FAILURE => ${failure.message}");
      sessionPageController?.loadFailed();
      sessionPageController?.refreshFailed();
      updateSessionPage();
      }, (result) {
      Get.log("QUIZ_CATEGORY_CONTROLLER  getQuizSessionList RESULT => $result");
      _catPageOffSet = result[0].offSet!;
      quizSessionList.addAll(result);
      sessionPageController?.refreshCompleted();
      sessionPageController?.loadComplete();
      updateSessionPage();
    });
  }

  ///when session item in the list is pressed this method is used to go to the sign page for entering quiz room
  void onSessionPressed() {
    Get.toNamed(AppRoutes.SIGN_IN_FOR_TEST_PAGE);
  }

  ///is used to update category page list view
  void updateSessionPage() {
    update([sessionPageId]);
  }
}

enum QuizState { initial, loading, loaded, error }
