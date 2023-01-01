import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/quiz/user_profile/create_question_controller.dart';
import 'package:get/get.dart';

class CreateVariants extends StatelessWidget {
  final _controller = Get.find<CreateQuestionController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: getLeading(),
        title: const Text(
          'Doctors Day',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder(
            init: _controller,
            id: _controller.rebuildAll,
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(12),
                  ),

                  ///Next and Prev Buttons
                  getPrevButtons(),

                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(12),
                  ),

                  ///Question Box
                  getQuesTextField(),

                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(12),
                  ),

                  GetBuilder(
                      id: _controller.radioBtnId,
                      init: _controller,
                      builder: (context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height:
                                        SizeConfig.calculateBlockVertical(
                                            24),
                                    width:
                                        SizeConfig.calculateBlockHorizontal(
                                            24),
                                    child: Checkbox(
                                      value: _controller.type == 1
                                          ? true
                                          : false,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4),
                                      ),
                                      onChanged: (val) {
                                        _controller.setTypeVale(val);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    '4 variants',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            _controller.type == 1
                                ? Column(
                                    children: [
                                      ///all variants from a to b
                                      createVariantA(),
                                      SizedBox(
                                        height: SizeConfig
                                            .calculateBlockVertical(12),
                                      ),

                                      createVariantB(),
                                      SizedBox(
                                        height: SizeConfig
                                            .calculateBlockVertical(12),
                                      ),
                                      createVariantC(),
                                      SizedBox(
                                        height: SizeConfig
                                            .calculateBlockVertical(12),
                                      ),
                                      createVariantD(),
                                      SizedBox(
                                        height: SizeConfig.calculateBlockVertical(120),
                                      ),
                                    ],
                                  )
                                : Padding(
                                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                                  child: Column(
                                    children: [
                                      SizedBox(height: SizeConfig.calculateBlockVertical(50),),
                                      SizedBox(
                                          child: TextField(
                                            controller:
                                                _controller.oneVariantController,
                                            decoration: const InputDecoration(
                                                hintText: "Введите ответ"),
                                            maxLines: 1,
                                          ),
                                        ),
                                      SizedBox(
                                        height: SizeConfig.calculateBlockVertical(295),
                                      ),
                                    ],
                                  ),
                                ),
                          ],
                        );
                      }),

                  buildBottomButton()
                ],
              );
            }),
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

  getPrevButtons() {
    return SizedBox(
        height: SizeConfig.calculateBlockVertical(24),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            const SizedBox(),

            ///Previous
            _controller.currentQuestionIndex > 0
                ? InkWell(
                    child: Image.asset(AppImages.PREVIOUS),
                    onTap: () {
                      _controller.prevBtbPressed();
                    },
                  )
                : const SizedBox(),

            Text('Question ${_controller.currentQuestionIndex + 1}'),

            // SizedBox(
            //   width: SizeConfig.calculateBlockHorizontal(16),
            // ),

            ///Next
            _controller.currentQuestionIndex < _controller.list.length - 1
                ? InkWell(
                    child: Image.asset(AppImages.NEXT),
                    onTap: () {
                      _controller.nextBtnPressed();
                    },
                  )
                : const SizedBox(),
            // const Expanded(child: SizedBox()),
            const SizedBox(),
            const SizedBox(),
          ],
        ));
  }

  getQuesTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        height: SizeConfig.calculateBlockVertical(240),
        child: TextField(
          maxLines: 20,
          controller: _controller.questionController,
          decoration: InputDecoration(
            labelText: 'Вопрос..',
            border: myInputBorder(),
          ),
        ),
      ),
    );
  }

  myInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.black26, width: 1));
  }

  createVariantA() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(60),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'A:',
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller.variantAController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                Radio(
                    value: _controller.chosenIndex == 0 ? true : false,
                    groupValue: true,
                    onChanged: (v) {
                      _controller.radioBtnPressed(0);
                    })
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
  }

  createVariantB() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(60),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'B:',
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller.variantBController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                Radio(
                    value: _controller.chosenIndex == 1 ? true : false,
                    groupValue: true,
                    onChanged: (v) {
                      _controller.radioBtnPressed(1);
                    })
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
  }

  createVariantC() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(60),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'C:',
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller.variantCController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                Radio(
                    value: _controller.chosenIndex == 2 ? true : false,
                    groupValue: true,
                    onChanged: (v) {
                      _controller.radioBtnPressed(2);
                    })
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
  }

  createVariantD() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(60),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'D:',
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller.variantDController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                Radio(
                    value: _controller.chosenIndex == 3 ? true : false,
                    groupValue: true,
                    onChanged: (v) {
                      _controller.radioBtnPressed(3);
                    })
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
  }

  buildBottomButton() {
    return Column(
      children: [
        GetBuilder(
            id: _controller.bottomBtnId,
            init: _controller,
            builder: (context) {
              return Container(
                  width: double.infinity,
                  height: SizeConfig.calculateBlockVertical(56),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 10,
                          offset: Offset(4, 8)),
                    ],
                  ),
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.addBtnPressed();
                      },
                      child: const Text('ADD QUESTION'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _controller.notNull()
                              ? Colors.teal
                              : Colors.white24),
                    ),
                    width: double.infinity,
                  ));
            }),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        // Container(
        //     width: double.infinity,
        //     height: 56,
        //     padding: const EdgeInsets.only(left: 16, right: 16),
        //     decoration: const BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //             color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
        //       ],
        //     ),
        //     child: SizedBox(
        //       child: ElevatedButton(
        //         onPressed: () {},
        //         child: const Text('START', style: TextStyle(color: Colors.white),),
        //         style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        //       ),
        //       width: double.infinity,
        //     )),
        // SizedBox(height: SizeConfig.calculateBlockVertical(16),),
      ],
    );
  }
}
