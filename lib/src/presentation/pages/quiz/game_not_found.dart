import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_images.dart';
import '../../../../core/utils/size_config.dart';

class GameNotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: getLeading(),
        backgroundColor: Colors.white,
        elevation: 0,
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
            child: const Text('ЗАкрыть'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
          ),
          width: double.infinity,
        ));
  }
}
