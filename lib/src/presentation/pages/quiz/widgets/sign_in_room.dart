import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class SignInRoomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(32),
          ),
          Text(
            "Open the room",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: SizeConfig.calculateTextSize(22)),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(12),
          ),
          Text(
            "write the code to start quiz",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.calculateTextSize(16)),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(32),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: "Nickname Quiz"
            ),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(32),
          ),
          const TextField(
            decoration: InputDecoration(
                hintText: "Password for quiz room"
            ),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(28),
          ),
          buildBottomButton()
        ],
      ),
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
            child: const Text('Start'),
          ),
          width: double.infinity,
        ));
  }

}
