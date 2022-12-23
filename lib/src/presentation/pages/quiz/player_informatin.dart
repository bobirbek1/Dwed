import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_images.dart';
import '../../../../core/utils/size_config.dart';

class PlayerInformationPage extends StatelessWidget {
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
          Expanded(child: ListView.builder(itemBuilder: (_, index) {
            return getItem();
          }, itemCount: 10,)),
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

  getItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          const SizedBox(height: 16,),

          SizedBox(
            width: double.infinity,
            child: Text(
              '1- КВИЗ',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(12),
                  fontWeight: FontWeight.w400, color: Colors.black),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'uchastvo : 4444 bal',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400, color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'uchastvo : 4444 bal',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400, color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'uchastvo : 4444 bal',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400, color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'uchastvo : 4444 bal',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400, color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'uchastvo : 4444 bal',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400, color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'uchastvo : 4444 bal',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400, color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'uchastvo : 4444 bal',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400, color: Colors.black45),
            ),
          ),
          const SizedBox(height: 8,),
          Container(height: 1,color: Colors.black45,)
        ],
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
            child: const Text('ЗАкрыть'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
          ),
          width: double.infinity,
        ));
  }
}
