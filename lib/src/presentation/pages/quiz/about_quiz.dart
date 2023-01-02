import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/data/model/quiz/new/new_session_response.dart';
import 'package:flutter_template/src/presentation/controller/quiz/user_profile/about_quiz_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../app/app_images.dart';
import '../../../../core/utils/size_config.dart';

//this page is opened after pressing start button
class AboutQuizPage extends StatelessWidget {
  final _controller = Get.find<AboutQuizController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: getLeading(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          _controller.argument.name ?? "NO NAME",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.calculateTextSize(16),
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          getItems(),
          const Expanded(child: SizedBox()),
          buildBottomButton()
        ],
      ),
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

  getItems() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(56),
            child: Row(
              children: [
                SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(81),
                ),
                Container(
                  alignment: Alignment.center,
                  width: SizeConfig.calculateBlockHorizontal(213),
                  height: SizeConfig.calculateBlockVertical(56),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Text(
                    'Код комнаты: ${_controller.argument.id ?? "0000"}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.calculateTextSize(16),
                        color: Colors.blue),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(8),
                  height: SizeConfig.calculateBlockVertical(16),
                ),
                SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(24),
                  height: SizeConfig.calculateBlockVertical(24),
                  child: Image.asset(AppImages.CONVERT_SHAPE),
                )
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(24),
              width: double.infinity,
              child: Text(
                'Количество участников: ${_controller.argument.expectedParticipants}',
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(8),
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(24),
              width: double.infinity,
              child: Text(
                'Время на ответ: ${_controller.argument.questionTime ?? "30"}',
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(8),
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(24),
              width: double.infinity,
              child: Text(
                'Мест: ${_controller.argument.winnerNumber ?? "no winner"}',
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(8),
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(24),
              width: double.infinity,
              child: Text(
                'Вход: ${_controller.argument.reward ?? "no reward"}',
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(8),
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(24),
              width: double.infinity,
              child: Text(
                "Количество перезапусков Квиза: ${_controller.argument.questionNumber ?? "no"}",
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),
        ],
      ),
    );
  }

  buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){

            },
            child: Container(
                width: double.infinity,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const SizedBox(
                  child: Text(
                    'История Квиза',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue),
                  ),
                  width: double.infinity,
                )),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 56,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.blue),
              child: const Text(
                "НАчать",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white),
              )),
        ],
      ),
    );
  }
}
