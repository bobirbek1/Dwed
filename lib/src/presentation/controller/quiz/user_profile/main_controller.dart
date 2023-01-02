import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/src/domain/repository/quiz/get_quiz_rep.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/model/quiz/new/session_data_model.dart';
import '../../../../data/model/quiz/new/user_created_quiz_category.dart';
import '../../../../domain/usecase/quiz/get/abstract/get_available_quiz_categories.dart';

//this controller is used for quiz page with tab and bottom navigation
class MainController extends GetxController {
  GetAvailableQuizCatUseCase availableQuizCatUseCase;
  GetQuizRep getQuizRep;

  MainController(
      {required this.availableQuizCatUseCase, required this.getQuizRep});

  RefreshController refreshController = RefreshController();
  RefreshController sessionRefreshController = RefreshController();

  MainState catState =
      MainState.initial; // is used for get cats in tab bar view
  MainState sessionState = MainState.initial; // is used for all quiz page

  List<UserCreatedQuizCategoryModel> list = [];
  List<SessionDataModel> sessionList = [];

  int chosenIndex = -1;

  final String catId =
      "category_id_tab_bar_view"; // is used for get cats in tab bar view
  final String sessionId =
      "hor_category_id_main_controller"; // is used for all quiz page
  final String allId = "all_id_main_controller";

  int offset = 0; // for cats
  int sessionOffset = 0; //for quizzes in all quiz page

  @override
  void onInit() {
    refreshController.initialRefresh;

    super.onInit();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  void onRefresh() async {
    catState = MainState.loading;
    offset = 0;
    final res = await availableQuizCatUseCase.call(offset, "");
    res.fold((failure) {
      refreshController.refreshFailed();
      updateCats(MainState.error);
    }, (response) {
      list.clear();
      list.addAll(response);
      response.isNotEmpty
          ? refreshController.refreshCompleted()
          : refreshController.loadNoData();

      offset =
          response.isNotEmpty ? response[0].nextOffset ?? response.length : 0;

      updateCats(MainState.loaded);
    });
  }

  void onLoading() async {
    catState = MainState.loading;
    final res = await availableQuizCatUseCase.call(offset, "");
    res.fold((failure) {
      refreshController.loadFailed();
      updateCats(MainState.error);
    }, (response) {
      list.addAll(response);
      response.isNotEmpty
          ? refreshController.loadComplete()
          : refreshController.loadNoData();

      offset = response.isNotEmpty
          ? response[0].nextOffset ?? response.length + offset
          : offset;

      updateCats(MainState.loaded);
    });
  }

  ///cat item in vertical list pressed
  void onCatItemPressed(int index) {
    if (chosenIndex == -1) {
      Get.toNamed(AppRoutes.ALL_QUIZ_PAGE);
    }
    chosenIndex = index;
    sessionOnRefresh(index);
  }

  ///cat item in horizontal list pressed
  void catOnAbovePressed(int index) async {
    chosenIndex = index;
    sessionOnRefresh(index);
  }

  void sessionOnLoad() async {
    updateSession(MainState.loading);
    final res = await getQuizRep.getActiveSessionByCat(
        offset, list[chosenIndex].id ?? 0);
    res.fold((failure) {
      sessionRefreshController.loadFailed();
      updateSession(MainState.error);
    }, (response) {
      sessionList.addAll(response);
      if (response.isEmpty) {
        sessionRefreshController.loadNoData();
        updateSession(MainState.loaded);
      } else {
        sessionRefreshController.loadComplete();
        updateSession(MainState.loaded);
      }
    });
  }

  void sessionOnRefresh(int index) async {
    offset = 0;
    updateSession(MainState.loading);
    final res = await getQuizRep.getActiveSessionByCat(
        offset, list[chosenIndex].id ?? 0);
    res.fold((failure) {
      sessionRefreshController.refreshFailed();
      updateSession(MainState.error);
    }, (response) {
      sessionList.clear();
      sessionList.addAll(response);
      if (response.isEmpty) {
        sessionRefreshController.loadNoData();
        updateSession(MainState.loaded);
      } else {
        sessionRefreshController.loadComplete();
        updateSession(MainState.loaded);
      }
    });
  }

  ///update cat vertical list
  void updateCats(MainState state) {
    catState = state;
    update([catId]);
  }

  void updateSession(MainState state) {
    sessionState = state;
    update([allId]);
  }
}

enum MainState { initial, loading, loaded, error }
