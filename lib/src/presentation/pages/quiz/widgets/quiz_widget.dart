import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/src/presentation/controller/quiz/quiz_category_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/utils/size_config.dart';

class QuizWidget extends StatelessWidget {
  final _controller = Get.find<QuizCategoryController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: _controller.sessionPageId,
      init: _controller,
      builder: (context) {
        return SmartRefresher(
          controller: _controller.sessionPageController!,
          enablePullDown: true,
          enablePullUp: true,
          onLoading: () {
            _controller.onLoadingCatPage();
          },
          onRefresh: () {
            _controller.onRefreshCatPage();
          },
          child: ListView.builder(
            itemCount: _controller.quizSessionList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
                child: InkWell(
                  onTap: () {
                    _controller.onSessionPressed();
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: SizeConfig.calculateBlockVertical(64),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: SizeConfig.calculateBlockVertical(56),
                          width: SizeConfig.calculateBlockHorizontal(56),
                          child: Image.asset(
                            AppImages.DACHA,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(16),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text(
                            _controller.quizSessionList[index].quiz!.name ?? ' ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${_controller.quizSessionList[index].questionTime ?? ' '}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}
