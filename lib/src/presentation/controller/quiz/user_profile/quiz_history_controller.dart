import 'package:flutter_template/src/data/model/quiz/new/start_session_model.dart';
import 'package:flutter_template/src/domain/usecase/quiz/get/abstract/active_sessions_usecase.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/model/quiz/new/session_data_model.dart';

class QuizHistoryController extends GetxController {
  ActiveSessionsUseCase activeSessionsUseCase;

  QuizHistoryController({required this.activeSessionsUseCase});

  RefreshController refreshController = RefreshController();


  List<SessionDataModel> list = [];

  final String listId = "list_id_quiz_history_page";


  HistoryPageState listState = HistoryPageState.initial;

  int offset = 0;

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

  void onLoading() async {
    listState = HistoryPageState.loading;
    final res = await activeSessionsUseCase.getActiveSessions(offset);
    res.fold((failure) {
      Get.log("QuizHistoryController onLoading FAILURE => ${failure.message}");
      refreshController.refreshFailed();
      listState = HistoryPageState.error;
      updateList();
    }, (response) {
      Get.log("QuizHistoryController onLoading RESPONSE => $response");
      list.addAll(response);
      refreshController.refreshCompleted();
      listState = HistoryPageState.loaded;
      if (response.isNotEmpty) {
        offset = response[0].offset ?? offset;
      } else {
        refreshController.loadNoData();
      }
      updateList();
    });
  }

  void onRefresh() async {
    listState = HistoryPageState.loading;
    offset = 0;
    final res = await activeSessionsUseCase.getActiveSessions(offset);
    res.fold((failure) {
      Get.log("QuizHistoryController onRefresh FAILURE => ${failure.message}");
      refreshController.refreshFailed();
      listState = HistoryPageState.error;
      updateList();
    }, (response) {
      Get.log("QuizHistoryController onRefresh RESPONSE => $response");
      list.clear();
      list.addAll(response);
      refreshController.refreshCompleted();
      listState = HistoryPageState.loaded;
      if (list.isNotEmpty) {
        offset = response[0].offset ?? offset;
      } else {
        refreshController.loadNoData();
      }
      updateList();
    });
  }

  void backPressed() {
    list.clear();
    Get.back();
  }

  void updateList() {
    update([listId]);
  }

  void closeBtnPressed() {
    list.clear();
    Get.back();
  }
}

enum HistoryPageState { initial, loading, loaded, error }
