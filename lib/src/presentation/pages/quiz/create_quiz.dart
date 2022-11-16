import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_images.dart';

import '../../../../app/app_icons.dart';
import '../../../../core/utils/size_config.dart';

class CreateQuiz extends StatelessWidget {
  TextEditingController _textController = TextEditingController();

  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: getLeading(),
        title: Text(
          'Create Quiz',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.calculateTextSize(16)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.calculateBlockVertical(16),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Название',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(10),
                      fontWeight: FontWeight.w400,
                      color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(8),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Какой то там Quiz ',
                ),
              ),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(16),
              ),

              ///Text Filed
              getTextField(),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(16),
              ),

              ///List
              getListOfPic(),
              SizedBox(
                height: SizeConfig.calculateBlockVertical(16),
              ),

              SizedBox(
                width: double.infinity,
                child: Text(
                  'Время на ответ/сек.',
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(10),
                      fontWeight: FontWeight.w400,
                      color: Colors.blueAccent),
                ),
              ),
              const TextField(),

              ///
              SizedBox(
                height: SizeConfig.calculateBlockVertical(16),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Призовых мест',
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(10),
                      fontWeight: FontWeight.w400,
                      color: Colors.blueAccent),
                ),
              ),
              const TextField(),

              ///
              SizedBox(
                height: SizeConfig.calculateBlockVertical(16),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  ' ',
                  style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(10),
                      fontWeight: FontWeight.w400,
                      color: Colors.blueAccent),
                ),
              ),
              const TextField(),

              SizedBox(
                height: SizeConfig.calculateBlockVertical(20),
              ),

              ///switch and calendar
              getSwitch(),

              SizedBox(
                height: SizeConfig.calculateBlockVertical(20),
              ),

              ///Calendar
              getCalendar(),

              SizedBox(
                height: SizeConfig.calculateBlockVertical(40),
              ),

              buildBottomButton()

            ],
          ),
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
        SizedBox(child: Image.asset(AppImages.APP_BAR_LEFT),
          height: SizeConfig.calculateBlockHorizontal(16),
          width: SizeConfig.calculateBlockHorizontal(24),
        )
      ],
    );
  }

  getTextField() {
    return SizedBox(
      height: SizeConfig.calculateBlockVertical(100),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: TextField(
          maxLines: 3,
          controller: _textController,
          decoration: InputDecoration(
            labelText: 'Название',
            border: myInputBorder(),
          ),
        ),
      ),
    );
  }

  myInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.black26, width: 1));
  }

  getListOfPic() {
    return Container(
      height: 110,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Container(
            child: Image.asset(AppImages.PLACE_HOLDER),
            height: 104,
            width: 104,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 1,
      ),
    );
  }

  getSwitch() {
    return SizedBox(
      height: SizeConfig.calculateBlockVertical(24),
      width: double.infinity,
      child: Row(
        children: [
          const Text('Начинать синхронно'),
          const Expanded(
            child: SizedBox(),
          ),
          Switch(
            value: isSwitched,
            onChanged: (bool value) {
              isSwitched = value;
            },
          )
        ],
      ),
    );
  }

  getCalendar() {
    return SizedBox(
      height: SizeConfig.calculateBlockVertical(24),
      width: double.infinity,
      child: Row(
        children: [
          const Text('Начинать синхронно'),
          const Expanded(
            child: SizedBox(),
          ),
          InkWell(
            child: Image.asset(AppImages.CALENDAR),
            onTap: () {

            },
          ),
          SizedBox(width: SizeConfig.calculateBlockHorizontal(8),)
        ],
      ),
    );
  }

  buildBottomButton() {
    return Container(
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
            child: const Text('Продолжить'),
          ),
          width: double.infinity,
        ));
  }

  showDataPicker(BuildContext context) async {
    DateTime? dateTime = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2023));
  }
}
