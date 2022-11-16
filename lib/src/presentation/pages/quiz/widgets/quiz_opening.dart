import 'package:flutter/cupertino.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class QuizOpeningWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: SizeConfig.calculateBlockVertical(32),),
      Text(
        "it soon starts...",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: SizeConfig.calculateTextSize(24),
            fontWeight: FontWeight.bold),
      ),
      SizedBox(height: SizeConfig.calculateBlockVertical(32),),
      Text(
        'What kind of quiz you want',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: SizeConfig.calculateTextSize(16),
        )
      )
    ]);
  }
}
