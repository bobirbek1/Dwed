import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';

import '../../../../app/app_icons.dart';

class QuestioningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: getAppBar(),
      body: Column(
        children: [
          buildQuestionSection(),
          const Expanded(child: SizedBox()),
          buildVariantSection()
        ],
      ),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: getLeading(),
      title: Text(
        "Sogiling saqlash hizmati",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: SizeConfig.calculateTextSize(16)),
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
          child: Image.asset(AppImages.LEFT_ARROW),
          height: SizeConfig.calculateBlockVertical(16),
          width: SizeConfig.calculateBlockHorizontal(8),
        )
      ],
    );
  }

  buildQuestionSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
            child: Text(
              'when legend michael djacson was born? hdcdscnjcn cnsajc sanc xs nxsanx sa ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(18),
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(168),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A: 1990',
                    style: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(18),
                        fontWeight: FontWeight.w400),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    'A: 1990',
                    style: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(18),
                        fontWeight: FontWeight.w400),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    'A: 1990',
                    style: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(18),
                        fontWeight: FontWeight.w400),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    'A: 1990',
                    style: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(18),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  buildVariantSection() {
    return Column(
      children: [
        ///question index
        Text(
          'question 15 / 20',
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(16),
              fontWeight: FontWeight.w500,
              color: Colors.black26),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(12),
        ),

        ///question time
        Text(
          '1 : 00 minutes',
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(16),
              fontWeight: FontWeight.w500,
              color: Colors.black26),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(24),
        ),

        ///Variants
        SizedBox(
          height: SizeConfig.calculateBlockVertical(216),
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  ///A variant
                  Expanded(
                    child: Container(
                      child: const Center(
                        child: Text(
                          "A",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      decoration: const BoxDecoration(color: Colors.blueAccent),
                    ),
                  ),

                  ///B variant
                  Expanded(
                      child: Container(
                    child: const Center(
                      child: Text(
                        "B",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    decoration: const BoxDecoration(color: Colors.cyanAccent),
                  )),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  ///C variant
                  Expanded(
                      child: Container(
                    child: const Center(
                      child: Text(
                        "C",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    decoration: const BoxDecoration(color: Colors.orange),
                  )),

                  ///D variant
                  Expanded(
                      child: Container(
                    child: const Center(
                      child: Text(
                        "D",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    decoration: const BoxDecoration(color: Colors.redAccent),
                  )),
                ],
              )),
            ],
          ),
        )
      ],
    );
  }
}
