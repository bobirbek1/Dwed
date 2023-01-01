import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/src/presentation/controller/quiz/user_profile/user_quiz_controller.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_config.dart';

class CreateQuiz extends StatelessWidget {
  final _controller = Get.find<UserQuizController>();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    onWillPop: () async {
      _controller.backButtonPressed();
      return false;
    };
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: getLeading(),
        title: Text(
          'Create Quiz',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.calculateTextSize(16),
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    getCategory(),

                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(16),
                    ),

                    ///Text Filed
                    getTextField(),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(16),
                    ),

                    getDescription(),

                    ///List
                    getListOfPic(),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(16),
                    ),

                    getTime(),

                    ///
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(16),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Призовых мест',
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(10),
                            fontWeight: FontWeight.w400,
                            color: Colors.blueAccent),
                      ),
                    ),
                    const TextField(
                      keyboardType: TextInputType.number,
                    ),

                    ///
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(16),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Платный UZS',
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(10),
                            fontWeight: FontWeight.w400,
                            color: Colors.blueAccent),
                      ),
                    ),
                    const TextField(
                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(24),
                    ),

                   // getSwitch(),

                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(20),
                    ),

                    buildBottomButton(),

                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(16),
                    ),

                    ///switch and calendar
                    //  getSwitch(),

                    ///Calendar
                    //  getCalendar(),

                    // SizedBox(
                    //   height: SizeConfig.calculateBlockVertical(40),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getLeading() {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(16),
        ),
        InkWell(
          onTap: () {
            _controller.backButtonPressed();
          },
          child: SizedBox(
            child: Image.asset(AppImages.APP_BAR_LEFT),
            height: SizeConfig.calculateBlockHorizontal(16),
            width: SizeConfig.calculateBlockHorizontal(24),
          ),
        )
      ],
    );
  }

  getCategory() {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            "Category",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(10),
                fontWeight: FontWeight.w400,
                color: Colors.blueAccent),
          ),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(8),
        ),
        InkWell(
          onTap: () {
            _controller.categoryPressed();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder(
                  id: _controller.quizCatID,
                  init: _controller,
                  builder: (context) {
                    return Text(
                      _controller.category ?? "Category*",
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.GRAY_X11),
                    );
                  }),
              SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(16),
                  height: SizeConfig.calculateBlockVertical(7),
                  child: Image.asset(AppImages.VECTOR_BOTTOM)),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(8),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.GRAY_X11,
        ),
      ],
    );
  }

  getTime() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            'Время на ответ/сек.',
            style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(10),
                fontWeight: FontWeight.w400,
                color: Colors.blueAccent),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: _controller.quizTimeLimitController,
        ),
      ],
    );
  }

  getTextField() {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            "Название",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(10),
                fontWeight: FontWeight.w400,
                color: Colors.blueAccent),
          ),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(8),
        ),
        TextField(
          controller: _controller.quizNameController,
          decoration: const InputDecoration(
              hintText: 'Xoчешь выиграть айфон?', border: InputBorder.none),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.GRAY_X11,
        ),
      ],
    );
  }

  myInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.black26, width: 1));
  }

  getDescription() {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.calculateBlockVertical(100),
          width: double.infinity,
          child: TextField(
              controller: _controller.quizDescriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(4),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.GRAY_X11),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: 'Описание',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.GRAY_X11),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              )),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(20),
        )
      ],
    );
  }

  getListOfPic() {
    return GetBuilder(
        id: _controller.loadedImagesId,
        init: _controller,
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            height: 110,
            child: ListView.builder(
              itemBuilder: (_, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                      _controller.loadImageFromGallery();
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: SizeConfig.calculateBlockVertical(104),
                          width: SizeConfig.calculateBlockHorizontal(104),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(width: 1, color: AppColors.GRAY_X11),
                            // image: const DecorationImage(
                            //   image: AssetImage(
                            //     AppImages.PLACE_HOLDER_SECOND,
                            //   ),
                            // )
                          ),
                          child: SizedBox(
                            width: SizeConfig.calculateBlockHorizontal(80),
                            height: SizeConfig.calculateBlockVertical(80),
                            child: Image.asset(AppImages.PLACE_HOLDER_SECOND),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                  );
                } else {
                  return Row(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                              height: 104,
                              width: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1, color: AppColors.GRAY_X11),
                                image: DecorationImage(
                                    image: FileImage(File(_controller
                                        .imageFiles[index - 1].path)),
                                    fit: BoxFit.cover),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: () {
                                _controller.deleteImageFile(index - 1);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: SizeConfig.calculateBlockVertical(25),
                                width: SizeConfig.calculateBlockHorizontal(25),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.GRAY_X11),
                                child: const Icon(Icons.delete),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      )
                    ],
                  );
                }
              },
              scrollDirection: Axis.horizontal,
              itemCount: _controller.imageFiles.length + 1,
            ),
          );
        });
  }

  getSwitch() {
    return SizedBox(
      height: SizeConfig.calculateBlockVertical(24),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Использовать код'),
          Switch(
            value: isSwitched,
            onChanged: (bool value) {
              isSwitched = value;
            },
          )
        ],
      ),
    );
  }

  getCalendar() {
    return SizedBox(
      height: SizeConfig.calculateBlockVertical(24),
      width: double.infinity,
      child: Row(
        children: [
          const Text('Начинать синхронно'),
          const Expanded(
            child: SizedBox(),
          ),
          InkWell(
            child: Image.asset(AppImages.CALENDAR),
            onTap: () {},
          ),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(8),
          )
        ],
      ),
    );
  }

  buildBottomButton() {
    return GetBuilder(
        id: _controller.bottomButtonId,
        init: _controller,
        builder: (context) {
          return Container(
              width: double.infinity,
              height: 56,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _controller.notNull() ? Colors.blue : Colors.black12,
                  ),
                  onPressed: () {
                    if (_controller.notNull()) {
                      _controller.bottomButtonPressed();
                    }
                  },
                  child: _controller.bottomButtonState == UserQuizState.loading
                      ? Center(
                          child: SizedBox(
                            width: SizeConfig.calculateBlockHorizontal(20),
                            height: SizeConfig.calculateBlockVertical(20),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const Text('Продолжить'),
                ),
                width: double.infinity,
              ));
        });
  }

// showDataPicker(BuildContext context) async {
//   DateTime? dateTime = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2022),
//       lastDate: DateTime(2023));
// }
}
