import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../app/app_images.dart';
import '../../../../../core/utils/size_config.dart';


class EducationNoQuiz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(120),
          ),
          getPicture(),
          buildBottomButton()
        ],
      ),
    );
  }

  getPicture() {
    return Column(
      children: [
        SizedBox(
            height: SizeConfig.calculateBlockVertical(260),
            width: SizeConfig.calculateBlockHorizontal(192),
            child: Image.asset(AppImages.NO_QUIZ_ASTRANOUT)),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(24),
        ),
        Text(
          'No Quiz now',
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(24),
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(8),
        ),
        Text(
          'Please check quiz later',
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(16),
              fontWeight: FontWeight.w400,
              color: Colors.black45),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(32),
        ),
      ],
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
            child: const Text('Try again'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),
          width: double.infinity,
        ));
  }

}