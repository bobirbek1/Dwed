import 'package:flutter/material.dart';

import '../../../../../app/app_images.dart';
import '../../../../../core/utils/size_config.dart';

class GameNotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(90),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(310),
            width: SizeConfig.calculateBlockHorizontal(313),
            child: Image.asset(AppImages.LOGO_NET),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'No game yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.calculateTextSize(24),
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(8),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Game not found',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.calculateTextSize(16),
                  color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}
