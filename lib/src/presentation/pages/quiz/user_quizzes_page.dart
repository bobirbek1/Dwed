import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/src/presentation/controller/quiz/user_profile/user_quiz_controller.dart';
import 'package:flutter_template/src/presentation/pages/quiz/no_quiz.dart';
import 'package:get/get_core/src/get_main.dart';
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
        body: getBody());
  }

  getBody() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        getList(),
        Container(
          height: SizeConfig.calculateBlockVertical(100),
          width: double.infinity,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: (){
                _controller.createPressed();
              },
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.calculateBlockVertical(56),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.blue,
                ),
                child: const Text(
                  'Create',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.WHITE),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  getList() {
    return GetBuilder(
      init: _controller,
      id: _controller.quizListId,
      builder: (context) {
        return SmartRefresher(
          controller: _controller.refreshController,
          onLoading: (){
            _controller.onLoading();
          },
          onRefresh: (){
            _controller.onRefresh();
          },
          child:_controller.list.isEmpty? NoQuizPage() :  ListView.builder(
              itemCount: _controller.list.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
                      child: InkWell(
                        onTap: () {},
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
                                children: [
                                  Text(
                                    _controller.list[index].name ?? " ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    _controller.list[index].questionTime.toString() ?? " ",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    index == 19
                        ? SizedBox(
                            height: SizeConfig.calculateBlockVertical(80),
                          )
                        : const SizedBox()
                  ],
                );
              }),
        );
      }
    );
  }
}
