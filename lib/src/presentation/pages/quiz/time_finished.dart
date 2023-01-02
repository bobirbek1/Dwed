import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_images.dart';
import '../../../../core/utils/size_config.dart';

class TimeFinishedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: getLeading(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Подарок от НВС',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.calculateTextSize(16),
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Время вышло!\nОжидайте следующий \nвопрос',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.calculateTextSize(22),
                    color: Colors.black),
              ),
            ),
            const Expanded(child: SizedBox()),
            getCard(),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(16),
            ),
            getPhoneNumber(),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(16),
            ),
            getAdd(),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(32),
            ),
          ],
        ),
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

  getCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Card(
        elevation: 1,
        child: SizedBox(
          height: SizeConfig.calculateBlockVertical(80),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'savol 27/30',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w400,
                      color: Colors.black45),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'vaqt: 00:59 soniya',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w400,
                      color: Colors.black45),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'javob berganlar: 144',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(16),
                      fontWeight: FontWeight.w400,
                      color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getPhoneNumber() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: SizeConfig.calculateBlockVertical(56),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blue),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        'Для рекламы: (99) 820-48-28',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: SizeConfig.calculateTextSize(16),
            fontWeight: FontWeight.w500,
            color: Colors.blue),
      ),
    );
  }

  getAdd() {
    return Container(
      width: double.infinity,
      height: SizeConfig.calculateBlockVertical(253),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(image: AssetImage(AppImages.PHONE), fit: BoxFit.cover)),
    );
  }
}
