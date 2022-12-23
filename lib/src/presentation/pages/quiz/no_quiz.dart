import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_images.dart';
import '../../../../core/utils/size_config.dart';

class NoQuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        // appBar: AppBar(
        //   leading: getLeading(),
        //   actions: [
        //     SizedBox(
        //       height: SizeConfig.calculateBlockVertical(20),
        //       width: SizeConfig.calculateBlockHorizontal(16),
        //       child: Image.asset(AppImages.ACTION_ITEM),
        //     ),
        //     SizedBox(
        //       height: SizeConfig.calculateBlockVertical(20),
        //       width: SizeConfig.calculateBlockHorizontal(20),
        //
        //     )
        //   ],
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   title: Text(
        //     'Quiz',
        //     style: TextStyle(
        //         fontWeight: FontWeight.w500,
        //         fontSize: SizeConfig.calculateTextSize(16),
        //         color: Colors.black),
        //   ),
        // ),
        body: Center(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.calculateBlockVertical(140),
                ),
                getPicture(),
               // buildBottomButton()
              ],
            ),
          ),
        ));
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
          'You don`t have any Quiz',
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(24),
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(8),
        ),
        Text(
          'Create a question or questionnaire',
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
            onPressed: () {

            },
            child: const Text('CREATE'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),
          width: double.infinity,
        ));
  }
}
