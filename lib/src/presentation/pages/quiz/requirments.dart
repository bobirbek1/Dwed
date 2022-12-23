import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_images.dart';
import '../../../../core/utils/size_config.dart';

class RequirmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: getLeading(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Xoчешь выиграть айфон?',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.calculateTextSize(16),
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          getItems(),
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

  getItems() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(56),
            child: Row(
              children: [
                SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(81),
                ),
                Container(
                  alignment: Alignment.center,
                  width: SizeConfig.calculateBlockHorizontal(213),
                  height: SizeConfig.calculateBlockVertical(56),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Text(
                    'Код комнаты: 444 553',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.calculateTextSize(16),
                        color: Colors.blue),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(8),
                  height: SizeConfig.calculateBlockVertical(16),
                ),
                SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(24),
                  height: SizeConfig.calculateBlockVertical(24),
                  child: Image.asset(AppImages.CONVERT_SHAPE),
                )
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(24),
              width: double.infinity,
              child: Text(
                'chsb hsa cx sa xsahx',
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(8),
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(24),
              width: double.infinity,
              child: Text(
                'chsb hsa cx sa xsahx',
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(8),
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(24),
              width: double.infinity,
              child: Text(
                'chsb hsa cx sa xsahx',
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(8),
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(24),
              width: double.infinity,
              child: Text(
                'chsb hsa cx sa xsahx',
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(8),
            height: SizeConfig.calculateBlockVertical(16),
          ),
          SizedBox(
              height: SizeConfig.calculateBlockVertical(24),
              width: double.infinity,
              child: Text(
                'chsb hsa cx sa xsahx',
                style: TextStyle(
                    fontSize: SizeConfig.calculateTextSize(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),

        ],
      ),
    );
  }

  buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 56,
              alignment: Alignment.center,
              decoration:  BoxDecoration(
                border: Border.all(width: 1, color: Colors.blue),
              ),
              child: const SizedBox(
                child: Text('Istoriya', textAlign: TextAlign.center,style: TextStyle(color: Colors.blue),),
                width: double.infinity,
              )),
          SizedBox(height: SizeConfig.calculateBlockVertical(16),),

          Container(
              width: double.infinity,
              height: 56,
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
        ],
      ),
    );
  }
}
