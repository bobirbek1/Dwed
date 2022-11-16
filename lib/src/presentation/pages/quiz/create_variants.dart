import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';

import '../../../../app/app_icons.dart';

class CreateVariants extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: getLeading(),
        title: const Text(
          'Doctors Day',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(12),
          ),

          ///Next and Prev Buttons
          getPrevButtons(),

          SizedBox(
            height: SizeConfig.calculateBlockVertical(12),
          ),

          ///Question Box
          getQuesTextField(),

          SizedBox(
            height: SizeConfig.calculateBlockVertical(12),
          ),

          ///all variants from a to b
          createVariantA(),

          SizedBox(
            height: SizeConfig.calculateBlockVertical(12),
          ),

          createVariantB(),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(12),
          ),
          createVariantC(),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(12),
          ),
          createVariantD(),

          SizedBox(
            height: SizeConfig.calculateBlockVertical(108),
          ),

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

  getPrevButtons() {
    return SizedBox(
        height: SizeConfig.calculateBlockVertical(24),
        width: double.infinity,
        child: Row(
          children: [
            const Expanded(child: SizedBox()),

            ///Previous
            InkWell(
              child: Image.asset(AppImages.PREVIOUS),
              onTap: () {},
            ),
            SizedBox(
              width: SizeConfig.calculateBlockHorizontal(16),
            ),
            const Text('Question'),
            SizedBox(
              width: SizeConfig.calculateBlockHorizontal(16),
            ),

            ///Next
            InkWell(
              child: Image.asset(AppImages.NEXT),
              onTap: () {},
            ),
            const Expanded(child: SizedBox()),
          ],
        ));
  }

  getQuesTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.calculateBlockVertical(240),
        child: TextField(
          maxLines: 20,
          controller: textEditingController,
          decoration:
              InputDecoration(labelText: 'Вопрос..', border: myInputBorder()),
        ),
      ),
    );
  }

  myInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.black26, width: 1));
  }

  createVariantA() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(60),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'A:',
                  style: TextStyle(fontSize: SizeConfig.calculateTextSize(16), fontWeight: FontWeight.w400),
                ),
                const Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none),)),
                Radio(value: false, groupValue: false, onChanged: (v) {})
              ],
            ),
            Container(
              height: 1,
              color: Colors.black45,
            )
          ],
        ),
      ),
    );
  }

  createVariantB() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(60),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'B:',
                  style: TextStyle(fontSize: SizeConfig.calculateTextSize(16), fontWeight: FontWeight.w400),
                ),
                const Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none),)),
                Radio(value: false, groupValue: false, onChanged: (v) {})
              ],
            ),
            Container(
              height: 1,
              color: Colors.black45,
            )
          ],
        ),
      ),
    );
  }

  createVariantC() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(60),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'C:',
                  style: TextStyle(fontSize: SizeConfig.calculateTextSize(16), fontWeight: FontWeight.w400),
                ),
                const Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none),)),
                Radio(value: false, groupValue: false, onChanged: (v) {})
              ],
            ),
            Container(
              height: 1,
              color: Colors.black45,
            )
          ],
        ),
      ),
    );
  }

  createVariantD() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(60),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'D:',
                  style: TextStyle(fontSize: SizeConfig.calculateTextSize(16), fontWeight: FontWeight.w400),
                ),
                const Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none),)),
                Radio(value: false, groupValue: false, onChanged: (v) {})
              ],
            ),
            Container(
              height: 1,
              color: Colors.black45,
            )
          ],
        ),
      ),
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
            child: const Text('еще вопрос'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
          ),
          width: double.infinity,
        ));
  }
}
