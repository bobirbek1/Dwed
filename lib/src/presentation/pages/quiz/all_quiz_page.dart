import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/quiz/user_profile/main_controller.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/education_no_quiz.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllQuizPage extends StatelessWidget {
  final _controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.WHITE,
        elevation: 0,
        leading: Image.asset(AppImages.LOGO_DWED),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Quiz",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.blue),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                  width: 16,
                  height: 8,
                  child: Image.asset(AppImages.TOWARDS_BOTTOM)),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: GetBuilder(
        id: _controller.allId,
        init: _controller,
        builder: (context) {
          return Column(
            children: [
              getHorizontalListView(),
              _controller.sessionState == MainState.loading
                  ? const Expanded(
                    child: Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                  )
                  : _controller.sessionState == MainState.loaded &&
                          _controller.sessionList.isEmpty
                      ? EducationNoQuiz()
                      : Expanded(child: getVerticalListView())
            ],
          );
        }
      ),
    );
  }

  getHorizontalListView() {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      width: double.infinity,
      height: SizeConfig.calculateBlockVertical(52),
      child: Row(
        children: [
          GetBuilder(
              id: _controller.sessionId,
              init: _controller,
              builder: (context) {
                return Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                        itemCount: _controller.list.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return index != _controller.chosenIndex
                              ? InkWell(
                                  onTap: () {
                                    _controller.catOnAbovePressed(index);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.calculateBlockVertical(
                                            8),
                                        bottom:
                                            SizeConfig.calculateBlockVertical(
                                                8),
                                        left: 8),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.black45),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(24))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8,
                                            left: 16,
                                            right: 16),
                                        child: Text(
                                          _controller.list[index].name ??
                                              "no name",
                                          style: const TextStyle(
                                              color: Colors.black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    _controller.catOnAbovePressed(index);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.calculateBlockVertical(
                                            8),
                                        bottom:
                                            SizeConfig.calculateBlockVertical(
                                                8),
                                        left: 8),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black45, width: 1),
                                          color: Colors.blue,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(24))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8,
                                            left: 16,
                                            right: 16),
                                        child: Text(
                                          _controller.list[index].name ??
                                              "no name",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        }),
                  ),
                );
              }),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            height: 19,
            width: 19,
            child: Image.asset(AppImages.SEARCH_NORMAL),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            height: 19,
            width: 19,
            child: Image.asset(AppImages.VECTOR),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  getVerticalListView() {
    return GetBuilder(
        init: _controller,
        id: _controller.sessionId,
        builder: (context) {
          // if(_controller.sessionState == MainState.initial) {
          //   _controller.sessionOnRefresh(_controller.chosenIndex);
          // }
          return SmartRefresher(
            controller: _controller.sessionRefreshController,
            enablePullDown: true,
            enablePullUp: true,
            onLoading: () {
              _controller.sessionOnLoad();
            },
            onRefresh: () {
              _controller.sessionOnRefresh(_controller.chosenIndex);
            },
            child: ListView.builder(
                itemCount: _controller.sessionList.length,
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
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _controller.sessionList[index].quiz?.name ??
                                "no name",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            "questions: ${_controller.sessionList[index].createDate ?? '0'}",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          Text(
                            "sessions: ${_controller.sessionList[index].id ?? "0"}",
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
    return const AssetImage(AppImages.PLACE_HOLDER_AKHROR);
  }
}
