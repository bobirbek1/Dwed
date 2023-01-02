import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/data/model/quiz/new/new_question_post_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/start_session_model.dart';
import 'package:flutter_template/src/domain/usecase/quiz/get/abstract/get_question_list.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/quiz_settings.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../app/app_routes.dart';
import '../../../../data/model/quiz/new/question_list_model.dart';
import '../../../../data/model/quiz/new/user_quiz_response_model.dart';
import '../../../../domain/repository/quiz/post_quiz_rep.dart';
import '../../../../domain/usecase/quiz/post/abstract/post_add_question_usecase.dart';

//this controller is used for user's questions
// (create_questions) page and creating variants
// (create_variants) page
class CreateQuestionController extends GetxController {
  GetQuestionListUseCase getQuestionListUseCase;
  AddQuestionUseCase addQuestionUseCase;
  PostQuizRep postQuizRep;

  CreateQuestionController(
      {required this.getQuestionListUseCase, required this.addQuestionUseCase, required this.postQuizRep});

  ///an argument passed from the screen
  UserQuizResponseModel? argument; // = Get.arguments as UserQuizResponseModel;

  RefreshController refreshController = RefreshController();

  ///all the questions of the quiz will be kept in it
  List<QuestionListModel> list = [];

  ///is used for starting new session with data collected in bottom sheet
  StartSessionModel sessionModel = StartSessionModel();

  ///all used for question
  TextEditingController questionController = TextEditingController();
  TextEditingController variantAController = TextEditingController();
  TextEditingController variantBController = TextEditingController();
  TextEditingController variantCController = TextEditingController();
  TextEditingController variantDController = TextEditingController();
  TextEditingController oneVariantController =
      TextEditingController(); // if type == 1 this is used otherwise above all

  ///chosen index for radio buttons for question
  int chosenIndex = -1;

  int winnerNumber =
      1; // as there is no such field in UserQuizResponseModel or UserQuizzesModel, it is being set here

  ///id
  final String questionListId = "question_list_id_create_variants";
  final String bottomBtnId = "bottom_button_id_create_variants";
  final String radioBtnId = "radio_button_id_create_variants";
  final String startId = "start_bottom_sheet_id_history_page";

  //rebuild whole page and is used when user created new question or pressed prev or next buttons
  final String rebuildAll = "rebuild_all_create_variants";

  int offset = 0;

  ///is used to know question has 4 answers or one
  int type = 1;

  ///is used for keeping the index of the question when user pressed question or add question button
  int currentQuestionIndex = 0;

  CurrentState questionListState = CurrentState.initial;

  @override
  void onInit() {
    argument = Get.arguments as UserQuizResponseModel;

    refreshController.initialRefresh;
    questionController.addListener(onTextChanged);
    variantAController.addListener(onTextChanged);
    variantBController.addListener(onTextChanged);
    variantCController.addListener(onTextChanged);
    variantDController.addListener(onTextChanged);

    super.onInit();
  }

  @override
  void dispose() {
    refreshController.dispose();

    questionController.dispose();
    variantAController.dispose();
    variantBController.dispose();
    variantCController.dispose();
    variantDController.dispose();

    super.dispose();
  }

  void onRefresh() async {
    offset = 0;
    questionListState = CurrentState.loading;
    updateList();
    final res =
        await getQuestionListUseCase.getQuestionList(argument?.id ?? 0, offset);
    res.fold((failure) {
      Get.log(
          "CreateQuestionController onRefresh FAILURE => ${failure.message}");
      refreshController.refreshFailed();
      questionListState = CurrentState.error;
      updateList();
    }, (response) {
      Get.log("CreateQuestionController onRefresh RESPONSE => $response");
      list.clear();
      list.addAll(response);

      if (response.isNotEmpty) {
        offset = response[0].offset ?? offset;
        refreshController.refreshCompleted();
      } else {
        refreshController.loadNoData();
      }
      questionListState = CurrentState.loaded;
      updateList();
    });
  }

  void onLoading() async {
    final res =
        await getQuestionListUseCase.getQuestionList(argument?.id ?? 1, offset);
    questionListState = CurrentState.loading;
    updateList();
    res.fold((failure) {
      Get.log(
          "CreateQuestionController onRefresh FAILURE => ${failure.message}");
      refreshController.loadFailed();
      questionListState = CurrentState.error;
      updateList();
    }, (response) {
      Get.log("CreateQuestionController onRefresh RESPONSE => $response");
      list.addAll(response);
      refreshController.loadComplete();
      questionListState = CurrentState.loaded;
      if (response.isNotEmpty) {
        offset = response[0].offset ?? offset;
      } else {
        refreshController.loadNoData();
      }
      updateList();
    });
  }

  void startBtnPressed() {
    sessionModel = StartSessionModel();
    Get.bottomSheet(QuizSettings());
  }

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    return picked;
  }

  ///is called in bottom sheet
  void setUseCode(bool val) {
    sessionModel.useCode = val;
  }

  ///is called in bottom sheet
  void setStartData(DateTime dateTime) {
    sessionModel.expectedDate = dateTime.toString();
  }

  ///is called in bottom sheet
  void setEndData(DateTime dateTime) {
    sessionModel.expectedEndDate = dateTime.toString();
  }

  ///returns data for bottom sheet
  String getStartTime() {
    sessionModel.expectedDate =
        DateFormat('MM-dd-yyyy – kk:mm').format(DateTime.now());
    return sessionModel.expectedDate ?? DateTime.now().toString();
  }

  String getFinishTime() {
    sessionModel.expectedEndDate = DateFormat('MM-dd-yyyy – kk:mm').format(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
            DateTime.now().hour + 1));
    return sessionModel.expectedEndDate ??
        DateFormat('MM-dd-yyyy – kk:mm').format(DateTime(DateTime.now().year,
            DateTime.now().month, DateTime.now().day, DateTime.now().hour + 1));
  }


  void startBtnInBotSheetPres() async {
    Get.log("came");
    sessionModel.type = argument?.type ?? 1;
    sessionModel.expectedDate ??= DateTime.now().toString();
    sessionModel.useCode ?? false;
    sessionModel.expectedParticipant = 100;
    sessionModel.expectedEndDate ??= DateTime.now().toString();
    sessionModel.winnerNumber = winnerNumber;
    sessionModel.winnerNumber = 3;
    sessionModel.reward = argument?.reward ?? "no reward";
    sessionModel.questionTime = argument?.questionTime ?? 30;
    sessionModel.sendQuestion = argument?.sendQuestion ?? true;
    sessionModel.sendAnswer = argument?.sendAnswer ?? true;

    final res = await postQuizRep.startSession(sessionModel, argument?.id ?? 0);
    res.fold((failure) {
      Get.back();
    }, (response){
      Get.back();
      response.name = argument?.name ?? "no name";
      response.timeLimit = argument?.questionTime ?? 30;
      response.questionNumber = argument?.questionNumber ?? 0;
      Get.toNamed(AppRoutes.ABOUT_QUIZ, arguments: response);
    });
  }

  /// called when after creating one question add button is pressed again
  void addBtnPressed() async {
    if (!notNull()) {
      return;
    }
    final data = NewQuestionModel();
    data.addAnswers = <AddAnswers>[];
    if (type == 1) {
      data.addAnswers!.add(AddAnswers(
          id: argument?.id,
          text: variantAController.text,
          correctAnswer: chosenIndex == 0 ? true : false));
      data.addAnswers!.add(AddAnswers(
          id: argument?.id,
          text: variantBController.text,
          correctAnswer: chosenIndex == 1 ? true : false));
      data.addAnswers!.add(AddAnswers(
          id: argument?.id,
          text: variantCController.text,
          correctAnswer: chosenIndex == 2 ? true : false));
      data.addAnswers!.add(AddAnswers(
          id: argument?.id,
          text: variantDController.text,
          correctAnswer: chosenIndex == 3 ? true : false));
    } else {
      data.addAnswers?.add(AddAnswers(
          id: argument?.id,
          text: oneVariantController.text,
          correctAnswer: chosenIndex == 3 ? true : false));
    }

    data.type = list[currentQuestionIndex].answers?.length == 4 ? 1 : 2;
    data.text = questionController.text;

    Get.log("NEW QUESTION + text  + $data");
    final res = await addQuestionUseCase.addQuestion(data);
    res.fold((failure) {
      onRefresh();
      currentQuestionIndex = list.length;
      var data = QuestionListModel();
      list.add(data);
      currentQuestionIndex = list.length - 1;
      setAllNull();
      updateAll();
    }, (response) {
      list[currentQuestionIndex].index = response.index;
      list[currentQuestionIndex].quiz = response.quiz;
      list[currentQuestionIndex].id = response.id;

      response.answers?.map((e) {
        list[currentQuestionIndex].answers?.add(
            Answers(id: e.id, text: e.text, correctAnswer: e.correctAnswer));
      });
      if (currentQuestionIndex == list.length - 1) {
        list.add(QuestionListModel());
      }
      currentQuestionIndex++;
      setAllNull();
      updateAll();
    });
  }

  ///add button in question list page is pressed
  void addBtnInQuestionPagePressed() {
    currentQuestionIndex = list.length;
    var data = QuestionListModel();
    list.add(data);
    currentQuestionIndex = list.length - 1;
    Get.toNamed(AppRoutes.CREATE_VARIANTS);
  }

  void setAllNull() {
    questionController.clear();
    variantAController.clear();
    variantBController.clear();
    variantCController.clear();
    variantDController.clear();
    oneVariantController.clear();
  }

  bool notNull() {
    if (type == 2) {
      return chosenIndex != -1 && oneVariantController.text.isNotEmpty;
    }
    return chosenIndex != -1 &&
        questionController.text.isNotEmpty &&
        variantAController.text.isNotEmpty &&
        variantBController.text.isNotEmpty &&
        variantCController.text.isNotEmpty &&
        variantDController.text.isNotEmpty;
  }

  void radioBtnPressed(int index) {
    chosenIndex = index;
    Get.log("Radio BTN -=> $chosenIndex");
    updateBottomBtn();
    updateRadioBtn();
  }

  void prevBtbPressed() {
    currentQuestionIndex--;
    updateAll();
  }

  void nextBtnPressed() {
    currentQuestionIndex++;
    updateAll();
  }

  ///value of checkbox come here and what kind of question weather with 4 answers or not will be set
  ///true == 4, false == 1
  void setTypeVale(bool? value) {
    if (value != null) {
      if (type == 4) {
        type = 1;
      } else {
        type = 4;
      }
      updateRadioBtn();
    }
  }

  ///is called when question or answers
  void onTextChanged() {
    updateBottomBtn();
  }

  void bottomBtnPressed() {
    if (notNull()) {
      addBtnPressed();
    }
  }

  ///is called when it is needed to update list of questions
  void updateList() {
    update([questionListId]);
  }

  void updateRadioBtn() {
    update([radioBtnId]);
  }

  void updateBottomBtn() {
    update([bottomBtnId]);
  }

  void updateVariants() {
    update([]);
  }

  void updateAll() {
    update([rebuildAll]);
  }
}

enum CurrentState { initial, loading, loaded, error }
