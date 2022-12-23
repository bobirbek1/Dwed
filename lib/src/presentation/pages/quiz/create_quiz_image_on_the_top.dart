import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/quiz_category.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/quiz_settings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../app/app_images.dart';
import '../../../../core/utils/size_config.dart';

class CreateQuizImageOnTheTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: getLeading(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Создать Quiz',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.calculateTextSize(16),
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.calculateBlockVertical(16),
            ),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(104),
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return getItem(index == 9);
                },
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
            getTextFields(),
            getSwitchButton(),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(260),
            ),
            buildBottomButton()
          ],
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
        SizedBox(
          child: Image.asset(AppImages.APP_BAR_LEFT),
          height: SizeConfig.calculateBlockHorizontal(16),
          width: SizeConfig.calculateBlockHorizontal(24),
        )
      ],
    );
  }

  getItem(bool isLast) {
    return isLast
        ? Row(
            children: [
              SizedBox(
                width: SizeConfig.calculateBlockHorizontal(12),
              ),
              Container(
                height: SizeConfig.calculateBlockVertical(104),
                width: SizeConfig.calculateBlockHorizontal(104),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(image: AssetImage(AppImages.PHONE), fit: BoxFit.fill)),
              ),
              SizedBox(
                width: SizeConfig.calculateBlockHorizontal(12),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                height: SizeConfig.calculateBlockVertical(104),
                width: SizeConfig.calculateBlockHorizontal(104),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(width: 1, color: Colors.black45),
                    image: const DecorationImage(image: AssetImage(AppImages.PLACE_HOLDER_SECOND),)),
              ),
              SizedBox(
                width: SizeConfig.calculateBlockHorizontal(12),
              ),
            ],
          )
        : Row(
            children: [
              SizedBox(
                width: SizeConfig.calculateBlockHorizontal(12),
              ),
              Container(
                height: SizeConfig.calculateBlockVertical(104),
                width: SizeConfig.calculateBlockHorizontal(104),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(image: AssetImage(AppImages.PHONE), fit: BoxFit.fill)),
              ),
            ],
          );
  }

  getTextFields() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Время на ответ/сек.',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(10),
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
          ),
          const TextField(),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Призовых мест',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(10),
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
          ),
          const TextField(),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Платный вход',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(10),
                  fontWeight: FontWeight.w400,
                  color: Colors.redAccent),
            ),
          ),
          const TextField(),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
          ),
        ],
      ),
    );
  }

  getSwitchButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(24),
        width: double.infinity,
        child: Row(
          children: [
            Text(
              'Использовать код',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(16),
                  color: Colors.black45),
            ),
            const Expanded(child: SizedBox()),
            Switch(
              value: true,
              onChanged: (val) {},
            )
          ],
        ),
      ),
    );
  }

  buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          width: double.infinity,
          height: 56,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
            ],
          ),
          child: SizedBox(
            child: ElevatedButton(
              onPressed: () {
                Get.bottomSheet(QuizSettings());
              },
              child: const Text('Продолжить'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            width: double.infinity,
          )),
    );
  }
}
