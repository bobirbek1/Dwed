import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class WonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.calculateBlockVertical(32),
        ),
        const Text(
          'you won , congratulations!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(32),
        ),
        const Text(
          'you won , congratulations!',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        Container(
          width: SizeConfig.calculateBlockHorizontal(343),
          height: SizeConfig.calculateBlockVertical(240),
          child: Image.asset(
            AppImages.PHONE,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(41),
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
            BoxShadow(color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
          ],
        ),
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Get Prize'),
          ),
          width: double.infinity,
        ));
  }

}
