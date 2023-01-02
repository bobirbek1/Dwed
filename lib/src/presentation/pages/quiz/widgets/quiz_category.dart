import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controller/quiz/user_profile/user_quiz_controller.dart';

class QuizCategory extends StatefulWidget {
  int pressed = -1;
  final _controller = Get.find<UserQuizController>();

  @override
  State<QuizCategory> createState() => _QuizCategoryState();
}

class _QuizCategoryState extends State<QuizCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.calculateBlockVertical(435),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(20),
          ),
          Text(
            'Quiz category',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(18),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(20),
          ),

          SizedBox(
            height: SizeConfig.calculateBlockVertical(56),
            width: SizeConfig.calculateBlockHorizontal(375),
            child: TextField(
              controller: widget._controller.catSearchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 12,
                      height: 12,
                      child: InkWell(
                          onTap: () {
                            widget._controller
                                .crossButtonInBottomSheetPressed();
                          },
                          child: Image.asset(AppImages.CROSS))),
                ),
                hintText: "search...",
              ),
            ),
          ),

          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.GRAY_X11,
          ),

          Expanded(
            child: GetBuilder(
                init: widget._controller,
                id: widget._controller.availableCatsId,
                builder: (context) {
                  if (widget._controller.catState == UserQuizState.initial) {
                    widget._controller.onRefreshForCats();
                  }
                  return SmartRefresher(
                    enablePullUp: true,
                    enablePullDown: true,
                    controller: widget._controller.refreshControllerCategories,
                    onRefresh: () {
                      widget.pressed = -1;
                      widget._controller.onRefreshForCats();
                    },
                    onLoading: () {
                      widget._controller.onLoadingForCats();
                    },
                    child: widget._controller.catState == UserQuizState.loading
                        ? const Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator()),
                    )
                        : ListView.builder(
                        itemCount:
                        widget._controller.availableCategories.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16),
                            child: SizedBox(
                              height: SizeConfig.calculateBlockVertical(56),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  index == 0
                                      ? const SizedBox(
                                    height: 8,
                                  )
                                      : const SizedBox(),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(widget
                                          ._controller
                                          .availableCategories[index]
                                          .name ??
                                          "no name"),
                                      SizedBox(
                                          height: SizeConfig
                                              .calculateBlockVertical(24),
                                          width: SizeConfig
                                              .calculateBlockHorizontal(24),
                                          child: Radio(
                                              value: widget
                                                  ._controller
                                                  .availableCategories[
                                              index]
                                                  .currentValue,
                                              groupValue: true,
                                              onChanged: (val) {
                                                setState(() {

                                                  widget._controller
                                                      .setValueToCategoryText(
                                                      widget._controller
                                                          .availableCategories[index]
                                                          .name ?? "Categories");

                                                  /// if last pressed index differs from current it means new radio button is pressed
                                                  if (widget.pressed !=
                                                      index) {
                                                    widget._controller
                                                        .catRadioPressed(
                                                        index,
                                                        widget.pressed);

                                                    ///new chosen category is set
                                                    widget.pressed = index;
                                                  }
                                                });
                                              }))
                                    ],
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.black45,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }),
          ),

          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),

          //const Expanded(child: SizedBox()),

          buildBottomButton(),

          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Container(
          width: double.infinity,
          height: SizeConfig.calculateBlockVertical(56),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
            ],
          ),
          child: SizedBox(
            child: ElevatedButton(
              onPressed: () {
                widget._controller.catBottomPressed();
              },
              child: const Text('Select'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            width: double.infinity,
          )),
    );
  }
}
