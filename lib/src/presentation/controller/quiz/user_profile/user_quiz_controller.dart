import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_model.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quizzes_model.dart' ;
import 'package:flutter_template/src/presentation/pages/quiz/widgets/quiz_category.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/model/quiz/new/user_created_quiz_category.dart';
import '../../../../data/model/quiz/new/user_quiz_response_model.dart' hide AddImages;
import '../../../../domain/usecase/quiz/get/abstract/get_available_quiz_categories.dart';
import '../../../../domain/usecase/quiz/get/abstract/get_quiz_category_list_usecase.dart';
import '../../../../domain/usecase/quiz/post/abstract/create_quiz_usecase.dart';

class UserQuizController extends GetxController {
  GetUserQuizzesUseCase getUserQuizzesUseCase;
  GetAvailableQuizCatUseCase getAvailableQuizCatUseCase;
  CreateQuizUseCase createQuizUseCase;

  UserQuizController({
    required this.getUserQuizzesUseCase,
    required this.getAvailableQuizCatUseCase,
    required this.createQuizUseCase,
  });

  ///data for creating quiz by user and will be posted => "create quiz"
  UserQuizModel _newQuiz = UserQuizModel();

  final ImagePicker _imagePicker = ImagePicker();

  ///Id
  final quizListId = "quiz_list_id";
  final loadedImagesId = "loaded_images_id";
  final bottomButtonId = "bottom_button_id";
  final availableCatsId = "available_categories_id";
  final quizCatID = "quiz_cat_id_user_controller";

  ///values
  String category = "Category*";

  ///to know the state of pagination at current time
  UserQuizState catState = UserQuizState.initial; // is used for categories
  UserQuizState userQuizState = UserQuizState.initial; // for user's own quizzes
  UserQuizState bottomButtonState =
      UserQuizState.initial; // for bottom button in

  ///Text field controllers
  final quizNameController = TextEditingController();
  final quizDescriptionController = TextEditingController();
  final quizTimeLimitController = TextEditingController();
  final quizNumberLimitController = TextEditingController();
  final quizPrizeMoneyController = TextEditingController();
  final catSearchController =
      TextEditingController(); //  is used to search categories by their name

  ///off set
  int _offset =
      0; // is used for quizzes created by user itself and showed in my quiz page
  int _offsetAvailableCat =
      0; //is used for categories of user used while creating new quiz and showed in bottom sheet dialog

  ///list refresh controller
  RefreshController refreshController =
      RefreshController(); // for user quizzes in user quiz page
  RefreshController refreshControllerCategories =
      RefreshController(); //for categories available while creating new quiz by user

  ///list for user quizzes
  List<UserQuizzesModel> list = [];
  List<UserCreatedQuizCategoryModel> availableCategories = [];

  ///all images
  List<File> imageFiles = [];

  @override
  void onInit() {
    refreshController.initialRefresh;
    refreshControllerCategories.initialRefresh;

    quizNameController.addListener(listenTextFields);
    quizDescriptionController.addListener(listenTextFields);
    quizTimeLimitController.addListener(listenTextFields);
    quizNumberLimitController.addListener(listenTextFields);
    quizPrizeMoneyController.addListener(listenTextFields);
    catSearchController.addListener(onRefreshForCats);
    super.onInit();
  }

  @override
  void dispose() {
    quizNameController.dispose();
    quizDescriptionController.dispose();
    quizTimeLimitController.dispose();
    quizNumberLimitController.dispose();
    quizPrizeMoneyController.dispose();
    catSearchController.dispose();

    refreshControllerCategories.dispose();
    refreshControllerCategories.dispose();
    super.dispose();
  }

  void setCategory(int index) {
    _newQuiz.category = index;
    updateBottomButton();
  }

  void listenTextFields() {
    Get.log("TEXT FIELDS => ${quizNameController.text}");

    _newQuiz.name = quizNameController.text;
    _newQuiz.description = quizDescriptionController.text;
    _newQuiz.questionTime = quizTimeLimitController.text.isNotEmpty
        ? int.tryParse(quizTimeLimitController.text)
        : null;
    _newQuiz.reward = quizPrizeMoneyController.text;

    updateBottomButton();
  }

  ///navigating to CREATE_QUESTION_PAGE by pressing add question button
  void bottomButtonPressed() async {
    bottomButtonState = UserQuizState.loading;
    updateBottomButton();
    if (notNull()) {
      _newQuiz.sendAnswer = true;
      _newQuiz.sendQuestion = true;
      encodeImages();
      final res = await createQuizUseCase.call(_newQuiz);
      res.fold((failure) {
        Get.log(
            "UserQuizController bottomButtonPressed FAILURE => ${failure.message}");
        bottomButtonState = UserQuizState.error;
        updateBottomButton();
      }, (response) {
        Get.log(
            "UserQuizController bottomButtonPressed RESPONSE => $response}");
        bottomButtonState = UserQuizState.loaded;
        updateBottomButton();
        setAllNull();
        response.timeLimit = _newQuiz.questionTime;
        Get.toNamed(AppRoutes.CREATE_QUESTION_PAGE, arguments: response,
        );
      });
    }
  }

  void historyBtnPressed() {
    Get.toNamed(AppRoutes.PLAYER_INFORMATION);
  }

  ///is used for bottom button to know whether allowed or not by checking the fields
  bool notNull() {
    return _newQuiz.category != null &&
        _newQuiz.name != null &&
        _newQuiz.questionTime != null;
  }

  ///is used for loading the image from phone
  void loadImageFromGallery() async {
    var file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imageFiles.add(File(file.path));
      loadedImagesId;
      updateLoadedImages();
      Get.log("IMAGE INDEX ${imageFiles.length}");
    }
  }

  ///loaded image will be removed
  void deleteImageFile(int index) async {
    imageFiles.removeAt(index);
    updateLoadedImages();
  }

  ///is used for pagination of user quizzes
  void onLoading() async {
    userQuizState = UserQuizState.loading;
    final res = await getUserQuizzesUseCase.call(_offset);
    res.fold((failure) {
      Get.log("UserQuizController onLoading failure => ${failure.message}");
      refreshController.loadFailed();
      userQuizState = UserQuizState.error;
      updateList();
    }, (response) {
      Get.log("UserQuizController onLoading response => $response");
      list.addAll(response);
      if(response.isNotEmpty) {
      _offset = response[0].nextOffset ?? _offset;
      refreshController.loadComplete();
      }else {
        refreshController.loadNoData();
      }
      userQuizState = UserQuizState.loaded;
      updateList();
    });
  }

  ///is used for pagination of user quizzes
  void onRefresh() async {
    userQuizState = UserQuizState.loading;
    _offset = 0;
    final res = await getUserQuizzesUseCase.call(_offset);
    res.fold((failure) {
      Get.log("UserQuizController onRefresh failure => ${failure.message}");
      refreshController.refreshFailed();
      userQuizState = UserQuizState.error;
      list.clear();
      _offset = 0;
      updateList();
    }, (response) {
      Get.log("UserQuizController onRefresh response => $response");
      list.clear();
      list.addAll(response);
      _offset = response[0].nextOffset ?? 0;
      refreshController.refreshCompleted();
      userQuizState = UserQuizState.loaded;
      updateList();
    });
  }

  ///is used for pagination of categories in bottom sheet
  void onLoadingForCats() async {
    setValueToCategoryText("Category*");
    updateCatValue();
    catState = UserQuizState.loading;
    final res = await getAvailableQuizCatUseCase.call(_offsetAvailableCat,
        catSearchController.text.isNotEmpty ? catSearchController.text : "");
    res.fold((failure) {
      Get.log(
          "UserQuizController onLoadingForCats failure => ${failure.message}");
      refreshControllerCategories.loadFailed();
      catState = UserQuizState.error;
      updateCats();
    }, (response) {
      Get.log("UserQuizController onLoadingForCats response => $response");
      availableCategories.addAll(response);
      _offsetAvailableCat = response[0].nextOffset ?? _offsetAvailableCat;
      if (response.isEmpty) {
        refreshControllerCategories.loadNoData();
      } else {
        refreshControllerCategories.loadComplete();
      }
      catState = UserQuizState.loaded;
      updateCats();
    });
  }

  ///is used for pagination of categories in bottom sheet
  void onRefreshForCats() async {
    setValueToCategoryText("Category*");
    updateCatValue();
    _offsetAvailableCat = 0;
    _newQuiz.category = null;
    catState = UserQuizState.loading;
    final res = await getAvailableQuizCatUseCase.call(_offsetAvailableCat,
        catSearchController.text.isNotEmpty ? catSearchController.text : "");
    res.fold((failure) {
      Get.log(
          "UserQuizController onRefreshForCats failure => ${failure.message}");
      refreshControllerCategories.refreshFailed();
      catState = UserQuizState.error;
      availableCategories.clear();
      updateCats();
    }, (response) {
      Get.log("UserQuizController onRefreshForCats RESPONSE => $response}");

      availableCategories.clear();
      availableCategories.addAll(response);
      _offsetAvailableCat = response[0].nextOffset ?? 0;
      if (response.isEmpty) {
        refreshControllerCategories.loadNoData();
      } else {
        refreshControllerCategories.refreshCompleted();
      }
      catState = UserQuizState.loaded;
      updateCats();
    });
  }

  ///is called when user press create and this method starts to encode files into string to
  ///change the file into string for posting new quiz
  void encodeImages() {
    imageFiles.map((e) async {
      final bytes = await  e.readAsBytes();
      String image = base64Encode(bytes);
      _newQuiz.addImages?.add(AddImages(file: image));
    });
    imageFiles.clear();
  }

  void crossButtonInBottomSheetPressed() {
    catSearchController.text = "";
    onRefreshForCats();
  }

  ///radio button pressed in bottom sheet
  void catRadioPressed(int index, int oldIndex) {
    availableCategories[index].currentValue =
        !availableCategories[index].currentValue;

    //is called when category in bottom sheet is pressed and cat is set to new quiz
    //if id is null default 0 will be set
    _newQuiz.category = availableCategories[index].id;

    //old pressed radio value is being removed, if oldIndex == -1 it means that it was not pressed before
    if (oldIndex != -1) {
      availableCategories[oldIndex].currentValue =
          !availableCategories[oldIndex].currentValue;
    }
  }


  ///navigating to CREATE_QUESTION_PAGE by pressing quiz item in the list
  void userQuizItemPresses(UserQuizzesModel item) {

    var res = UserQuizResponseModel(
        id: item.id,
        questionNumber: item.questionNumber,
        sendQuestion: true,
        sendAnswer: true,
        name: item.name,
        description: item.description,
        questionTime: item.questionTime,
        reward: item.reward,
        creator: item.creator,
        category: item.category?.id);
    Get.log("Arguments $res");
    res.timeLimit = item.questionTime;
    Get.toNamed(AppRoutes.CREATE_QUESTION_PAGE, arguments:res
    );
  }

  void backButtonPressed() {
    setAllNull();
    _newQuiz = UserQuizModel();
  }

  void setAllNull() {
    quizNameController.clear();
    quizDescriptionController.clear();
    quizTimeLimitController.clear();
    quizNumberLimitController.clear();
    quizPrizeMoneyController.clear();
  }


  ///bottom button in bottom sheet of categories pressed
  void catBottomPressed() {
    Get.back();
  }

  void setValueToCategoryText(String category) {
    this.category =  category;
    updateCatValue();
  }

  ///is called category word is pressed and then bottom
  void categoryPressed() {
    onRefreshForCats();
    Get.bottomSheet(QuizCategory());
  }

  ///only text on categories will be updated
  void updateCatValue() {
    update([quizCatID]);
  }

  void createPressed() {
    Get.toNamed(AppRoutes.CREATE_QUIZ);
  }

  void updateList() {
    update([quizListId]);
  }

  void updateLoadedImages() {
    update([loadedImagesId]);
  }

  void updateBottomButton() {
    update([bottomButtonId]);
  }

  void updateCats() {
    update([availableCatsId]);
  }
}

enum UserQuizState { initial, loading, loaded, error }
