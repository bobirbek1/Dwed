import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../app/app_images.dart';
import '../../../../../core/utils/size_config.dart';

class QuizSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.calculateBlockVertical(435),
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.calculateBlockVertical(20),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Начать',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(18),
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(32),
            ),

            ///First
            Row(
              children: [
                Expanded(
                    child: Text(
                  'Начинать синхронно',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.calculateTextSize(16),
                      color: Colors.black45),
                )),
                SizedBox(
                    height: SizeConfig.calculateBlockVertical(24),
                    width: SizeConfig.calculateBlockHorizontal(24),
                    child: Switch(
                      value: false,
                      onChanged: (val) {},
                    )),
                const SizedBox(
                  width: 16,
                )
              ],
            ),

            SizedBox(
              height: SizeConfig.calculateBlockVertical(20),
            ),

            Row(
              children: [
                Expanded(
                    child: Text(
                  'Автоматически задавать вопросы',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.calculateTextSize(16),
                      color: Colors.black45),
                )),
                SizedBox(
                    height: SizeConfig.calculateBlockVertical(24),
                    width: SizeConfig.calculateBlockHorizontal(24),
                    child: Switch(
                      value: false,
                      onChanged: (val) {},
                    )),
                const SizedBox(
                  width: 16,
                )
              ],
            ),

            SizedBox(
              height: SizeConfig.calculateBlockVertical(20),
            ),

            Row(
              children: [
                Expanded(
                    child: Text(
                      'Дата и время начала квиза',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.calculateTextSize(16),
                          color: Colors.black45),
                    )),
                SizedBox(
                    height: SizeConfig.calculateBlockVertical(24),
                    width: SizeConfig.calculateBlockHorizontal(24),
                    child: SizedBox(height: SizeConfig.calculateBlockVertical(24),width: SizeConfig.calculateBlockHorizontal(24),child: Image.asset(AppImages.CALENDAR),)),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.calculateBlockVertical(20),
            ),

            Row(
              children: [
                Expanded(
                    child: Text(
                      'Использовать код',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.calculateTextSize(16),
                          color: Colors.black45),
                    )),
                SizedBox(
                    height: SizeConfig.calculateBlockVertical(24),
                    width: SizeConfig.calculateBlockHorizontal(24),
                    child: Switch(
                      value: false,
                      onChanged: (val) {},
                    )),
                const SizedBox(
                  width: 16,
                )
              ],
            ),

            const Expanded(child: SizedBox()),

            buildBottomButton(),

            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.only( bottom: 16),
      child: Container(
          width: double.infinity,
          height: SizeConfig.calculateBlockVertical(56),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
            ],
          ),
          child: SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('nachat'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            width: double.infinity,
          )),
    );
  }
}
