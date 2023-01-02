import 'package:flutter/material.dart';
import 'package:flutter_template/src/presentation/controller/quiz/user_profile/create_question_controller.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../app/app_images.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../controller/quiz/user_profile/quiz_history_controller.dart';

class QuizSettings extends StatelessWidget {
  final _controller = Get.find<CreateQuestionController>();

  @override
  Widget build(BuildContext context) {
    final buildContext = context;
    return Container(
      width: double.infinity,
      height: SizeConfig.calculateBlockVertical(435),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: GetBuilder(
            init: _controller,
            id: _controller.startId,
            builder: (context) {
              return Column(
                children: [
                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(20),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Начать',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(18),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(32),
                  ),

                  ///First
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Начинать синхронно',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.calculateTextSize(16),
                            color: Colors.black45),
                      )),
                      SizedBox(
                          height: SizeConfig.calculateBlockVertical(24),
                          width: SizeConfig.calculateBlockHorizontal(24),
                          child: Switch(
                            value: true,
                            onChanged: (val) {

                            },
                          )),
                      const SizedBox(
                        width: 16,
                      )
                    ],
                  ),

                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(20),
                  ),

                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Использовать код',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.calculateTextSize(16),
                            color: Colors.black45),
                      )),
                      SizedBox(
                          height: SizeConfig.calculateBlockVertical(24),
                          width: SizeConfig.calculateBlockHorizontal(24),
                          child: Switch(
                            value: _controller.sessionModel.useCode ?? false,
                            onChanged: (val) {
                              _controller.setUseCode(val);
                            },
                          )),
                      const SizedBox(
                        width: 16,
                      )
                    ],
                  ),

                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(20),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Дата и время начала квиза',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.calculateTextSize(16),
                            color: Colors.black45),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          SizedBox(
                              height: SizeConfig.calculateBlockVertical(24),
                              width: SizeConfig.calculateBlockHorizontal(24),
                              child: InkWell(
                                onTap: () {
                                  final data = _controller.selectDate(buildContext);
                                  _controller.setStartData(data);
                                },
                                child: SizedBox(
                                  height: SizeConfig.calculateBlockVertical(24),
                                  width: SizeConfig.calculateBlockHorizontal(24),
                                  child: Image.asset(AppImages.CALENDAR),
                                ),
                              )),
                          const SizedBox(
                            width: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(20),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Дата и время konets квиза',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.calculateTextSize(16),
                            color: Colors.black45),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          SizedBox(
                              height: SizeConfig.calculateBlockVertical(24),
                              width: SizeConfig.calculateBlockHorizontal(24),
                              child: InkWell(
                                onTap: () {
                                  final data = _controller.selectDate(buildContext);
                                  _controller.setEndData(data);
                                },
                                child: SizedBox(
                                  height: SizeConfig.calculateBlockVertical(24),
                                  width: SizeConfig.calculateBlockHorizontal(24),
                                  child: Image.asset(AppImages.CALENDAR),
                                ),
                              )),
                          const SizedBox(
                            width: 16,
                          )
                        ],
                      ),
                    ],
                  ),

                  const Expanded(child: SizedBox()),

                  buildBottomButton(),

                  const SizedBox(
                    height: 16,
                  )
                ],
              );
            }),
      ),
    );
  }

  buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
                _controller.startBtnInBotSheetPres();
              },
              child: const Text('START'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            width: double.infinity,
          )),
    );
  }
}
