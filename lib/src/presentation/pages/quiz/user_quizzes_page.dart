import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/src/presentation/controller/quiz/user_profile/user_quiz_controller.dart';
import 'package:flutter_template/src/presentation/pages/quiz/no_quiz.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/utils/size_config.dart';

class UserQuizzesPage extends StatelessWidget {
  final _controller = Get.find<UserQuizController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.WHITE,
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
                width: SizeConfig.calculateBlockHorizontal(7),
                height: SizeConfig.calculateBlockVertical(16),
                child: Image.asset(AppImages.LEFT_ARROW)),
          ),
          title: const Text(
            'Quiz',
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(24),
                  height: SizeConfig.calculateBlockVertical(24),
                  child: Image.asset(AppImages.VECTOR)),
            ),
            SizedBox(
              width: SizeConfig.calculateBlockHorizontal(8),
            )
          ],
        ),
        body: Column(
          children: [Expanded(child: getList()), getBottomButton()],
        ));
  }

  getBottomButton() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
            child: InkWell(
              onTap: () {
                _controller.historyBtnPressed();
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
                  "HISTORY",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                _controller.createPressed();
              },
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.calculateBlockVertical(56),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.blue,
                ),
                child: const Text(
                  'ADD QUIZ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.WHITE),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getList() {
    return GetBuilder(
        init: _controller,
        id: _controller.quizListId,
        builder: (context) {
          if (_controller.userQuizState == UserQuizState.initial) {
            _controller.onRefresh();
          }
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _controller.refreshController,
            onLoading: () {
              _controller.onLoading();
            },
            onRefresh: () {
              _controller.onRefresh();
            },
            child: _controller.userQuizState == UserQuizState.loading
                ? Center(
                    child: SizedBox(
                      width: SizeConfig.calculateBlockHorizontal(25),
                      height: SizeConfig.calculateBlockVertical(25),
                      child: const CircularProgressIndicator(),
                    ),
                  )
                : _controller.list.isEmpty
                    ? NoQuizPage()
                    : ListView.builder(
                        itemCount: _controller.list.length,
                        itemBuilder: (_, index) {
                          return getItem(index);
                        }),
          );
        });
  }

  getItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(64),
        child: Row(
          children: [
            Container(
              height: SizeConfig.calculateBlockVertical(56),
              width: SizeConfig.calculateBlockHorizontal(56),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: getImage(index), fit: BoxFit.contain)),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _controller
                            .userQuizItemPresses(_controller.list[index]);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _controller.list[index].name ?? "no name",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            "questions: ${_controller.list[index].questionNumber ?? '0'}",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          Text(
                            "sessions: ${_controller.list[index].sessionNumber ?? "0"}",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.black,
                  height: 1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  getImage(int index) {
    if (_controller.list[index].images != null &&
        _controller.list[index].images!.isNotEmpty &&
        _controller.list[index].images![0].file != null) {
      return NetworkImage(_controller.list[index].images![0].file!);
    } else {
      return const AssetImage(AppImages.PLACE_HOLDER_AKHROR);
    }
  }
}
