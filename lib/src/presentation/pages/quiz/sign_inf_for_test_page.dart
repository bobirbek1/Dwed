import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/lost.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/my_quizes.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/quiz_opening.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/sign_in_room.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/won.dart';

class SignInForTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: getAppBar(),
      body: Column(
        children: [
          getBlueSection(),
          MyQuiz()
        ],
      ),
    );
  }

  getAppBar() {
    return AppBar(
      elevation: 0,
      leading: getLeading(),
      title: const Text("Sogiling saqlash hizmati"),
    );
  }

  getLeading() {
    return Row(
      children: [
        SizedBox(width: SizeConfig.calculateBlockHorizontal(16),),
        SvgPicture.asset(AppIcons.ARROW_LEFT)
      ],
    );
  }

  getBlueSection() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
      height: SizeConfig.calculateBlockVertical(286),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.calculateBlockVertical(22),),
          Text(
              'Questions',
            style: TextStyle(fontSize: SizeConfig.calculateTextSize(32), fontWeight: FontWeight.bold,color: Colors.white,),
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(12),),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32),
            child: Text(
              'Respond the questions first and get the prizes chdscdncj dnjcndc dn cd cd cn dc djc dnc jd cjd c ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: SizeConfig.calculateTextSize(16), fontWeight: FontWeight.w300, color: Colors.white),
            ),
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(12),),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(80),
              width: SizeConfig.calculateBlockHorizontal(80),
              child: const CircleAvatar(
                backgroundImage: AssetImage(AppImages.BORDER),
              )),
          SizedBox(height: SizeConfig.calculateBlockVertical(16),)

        ],
      ),
    );
  }



}