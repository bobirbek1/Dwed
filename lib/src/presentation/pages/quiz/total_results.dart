import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_images.dart';
import '../../../../core/utils/size_config.dart';

class TotalResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: getLeading(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Результат',
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

          getTotalOne(),
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

  getTotalOne() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(72),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'Вопрос 1',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.calculateTextSize(12),
                            color: Colors.black26),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        'Congratulate',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.calculateTextSize(12),
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Ответил на 29 вопросов правильно из 70 Время на ответ: 03:43 секунд',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.calculateTextSize(16),
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.black38,
          )
        ],
      ),
    );
  }
}
