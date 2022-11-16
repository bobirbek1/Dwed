import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_images.dart';
import '../../../../core/utils/size_config.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: getLeading(),
        title: Text(
          'Вопрос 1',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.calculateTextSize(16),
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),

          ///Question
          getQuestion(),

          getLine(),

          getResult(),

          const Expanded(child: SizedBox()),

          ///Word Result
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'Следующий вопрос можно задать через: 00:39 секунд',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
          ),

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

  getQuestion() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(24),
        width: double.infinity,
        child: Text(
          'Когда родился Ленин?',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: SizeConfig.calculateTextSize(16),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  getLine() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(32),
          ),
          Container(
            height: 1,
            color: Colors.black45,
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(32),
          ),
        ],
      ),
    );
  }

  getResult() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          ///Word Result
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
            width: double.infinity,
            child: Text(
              'Результаты:',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),

          ///variant a
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
            width: double.infinity,
            child: Text(
              'Участники выбрали ответ А: 34',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
          ),

          ///variant b
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),

          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
            width: double.infinity,
            child: Text(
              'Участники выбрали ответ А: 34',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.blueAccent),
            ),
          ),

          ///variant c
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
            width: double.infinity,
            child: Text(
              'Участники выбрали ответ C: 4',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
          ),

          ///variant d
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),

          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
            width: double.infinity,
            child: Text(
              'Участники выбрали ответ D: 200',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
          ),

          ///no answer variant
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
            width: double.infinity,
            child: Text(
              'Не ответило/выбило участников: 5',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }

  buildBottomButton() {
    return Container(
        width: double.infinity,
        height: 56,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
          ],
        ),
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('ЗАдать следующий вопрос'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
          ),
          width: double.infinity,
        ));
  }
}
