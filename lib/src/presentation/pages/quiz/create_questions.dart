import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/data/model/quiz/new/user_quiz_response_model.dart';
import 'package:flutter_template/src/presentation/controller/quiz/user_profile/create_question_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../app/app_images.dart';

class CreateQuestionsPage extends StatelessWidget {
  final _controller = Get.find<CreateQuestionController>();

  CreateQuestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.argument = Get.arguments as UserQuizResponseModel;
    Get.log(
        "ARGUMENTS  ${_controller.argument?.name}  ${_controller.argument?.creator} ");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.WHITE,
        leading: getLeading(),
        title: Text(
          _controller.argument?.name ?? 'Quiz',
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.BLACK),
        ),
      ),
      body: GetBuilder(
          id: _controller.questionListId,
          init: _controller,
          builder: (context) {
            if (_controller.questionListState == CurrentState.initial) {
              _controller.onRefresh();
            }
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SmartRefresher(
                  controller: _controller.refreshController,
                  onLoading: () {
                    _controller.onLoading();
                  },
                  onRefresh: () {
                    _controller.onRefresh();
                  },
                  child: _controller.questionListState == CurrentState.loading
                      ? const Center(
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : _controller.questionListState == CurrentState.loaded &&
                              _controller.list.isEmpty
                          ? getPicture()
                          : getListView(),
                ),
                buildBottomButton()
              ],
            );
          }),
    );
  }

  getLeading() {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(16),
        ),
        SizedBox(
          child: Image.asset(AppImages.APP_BAR_LEFT),
          height: SizeConfig.calculateBlockHorizontal(16),
          width: SizeConfig.calculateBlockHorizontal(24),
        )
      ],
    );
  }

  getPicture() {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.calculateBlockVertical(140),
        ),
        SizedBox(
            height: SizeConfig.calculateBlockVertical(298),
            width: double.infinity,
            child: Image.asset(AppImages.NO_QUIZ_ROCKET)),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(24),
        ),
        Text(
          'No Question',
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(24),
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(8),
        ),
        Text(
          'Create a question or questionnaire',
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(16),
              fontWeight: FontWeight.w400,
              color: Colors.black45),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(32),
        ),
      ],
    );
  }

  getListView() {
    return ListView.builder(
        itemCount: _controller.list.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
            child: SizedBox(
              height: SizeConfig.calculateBlockVertical(64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Expanded(
                      child: Text(
                        "${index + 1}. ${_controller.list[index].text ?? "none"}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _controller.list[index].type == 1
                          ? "4 answers options"
                          : "1 answer option",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    color: Colors.black45,
                    height: 1,
                  )
                ],
              ),
            ),
          );
        });
  }

  buildBottomButton() {
    return Container(
      color: Colors.white,
      height: SizeConfig.calculateBlockVertical(160),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: InkWell(
              onTap: () {
                _controller.startBtnPressed();
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: SizeConfig.calculateBlockVertical(56),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  "START",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: InkWell(
              onTap: () {
                _controller.addBtnInQuestionPagePressed();
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: SizeConfig.calculateBlockVertical(56),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  "ADD QUESTION",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),
        ],
      ),
    );
  }
}
