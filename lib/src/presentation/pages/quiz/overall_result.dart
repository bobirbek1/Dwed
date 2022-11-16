import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/size_config.dart';

import '../../../../app/app_images.dart';

class OverallResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: getLeading(),
        title: Text(
          'День медика',
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

          ///one
          getQuesOne(),

          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),

          ///two
          getQuesTwo(),

          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),

          ///three
         getQuesThree(),

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

  getQuesOne() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Вопрос 1',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(12),
                  color: Colors.black26),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Правильно ответили 180/180',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(16),
                  color: Colors.black),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Вопрос 1',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(16), color: Colors.redAccent),
            ),
          ),

          SizedBox(height: SizeConfig.calculateBlockVertical(10),),

          Container(height: 1,color: Colors.black38,)
        ],
      ),
    );
  }

  getQuesTwo() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Вопрос 1',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(12),
                  color: Colors.black26),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Правильно ответили 180/180',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(16),
                  color: Colors.black),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Вопрос 1',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(16), color: Colors.redAccent),
            ),
          ),

          SizedBox(height: SizeConfig.calculateBlockVertical(10),),

          Container(height: 1,color: Colors.black38,)
        ],
      ),
    );
  }

  getQuesThree() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Вопрос 1',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(12),
                  color: Colors.black26),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Правильно ответили 180/180',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(16),
                  color: Colors.black),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Вопрос 1',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(16), color: Colors.redAccent),
            ),
          ),

          SizedBox(height: SizeConfig.calculateBlockVertical(10),),

          Container(height: 1,color: Colors.black38,)
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
            child: const Text('Детальный отчет'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          ),
          width: double.infinity,
        ));
  }
}
