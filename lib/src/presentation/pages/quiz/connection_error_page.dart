import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class ConnectionErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child:buildTopBody()
      ),
    );
  }


  Widget buildTopBody() {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.calculateBlockVertical(58),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(313),
          width: SizeConfig.calculateBlockHorizontal(310),
          child: SvgPicture.asset(AppIcons.BRO),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(24),
        ),
        Text(
          'No Quiz now',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.calculateTextSize(24),
          ),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(8),
        ),
        Text(
          'Please check quiz later',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: SizeConfig.calculateTextSize(16),
          ),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(32),
        ),
        buildBottomButton()
      ],
    );
  }

  Widget buildBottomButton() {
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
            child: const Text('Try again'),
          ),
          width: double.infinity,
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      leading: getLeading(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
            width: SizeConfig.calculateBlockHorizontal(24),
              child: Image.asset(AppImages.THREE_SQUARE)
          ),
        ),
      ],
    );
  }

  Widget getLeading() {
    return
        Row(
          children: [
            SizedBox(height: 0,width: SizeConfig.calculateBlockHorizontal(16),),
            Expanded(
              child: SizedBox(
                height: SizeConfig.calculateBlockVertical(24),
                width: SizeConfig.calculateBlockHorizontal(64),
                child: Image.asset(AppImages.LOGO_DWED),
              ),
            ),
          ],
        );
  }
}
