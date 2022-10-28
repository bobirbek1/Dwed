import 'package:flutter/material.dart';

import 'package:flutter_template/core/utils/size_config.dart';

class CheckoutOrdered extends StatelessWidget {
  const CheckoutOrdered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.calculateBlockVertical(220),
                  ),
                  buildCenterWidget(),
                ],
              ),
            ),
            buildBottomButton()
          ],
        ),
      ),
    );
  }

  Widget buildCenterWidget() {
    return Column(
      children: [
        Image.asset('assets/images/done_icon.png'),
        const Text(
          'Successfully ordered',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        const Text(
          'Thank you for choosing our application',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget buildBottomButton() {
    return Column(
      children: [
        SizedBox(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blueAccent)),
            child: const Text('View check details'),
          ),
          height: SizeConfig.calculateBlockVertical(56),
          width: double.infinity,
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(16),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Continue ordering ->'),
          ),
          height: SizeConfig.calculateBlockVertical(56),
          width: double.infinity,
        ),
      ],
    );
  }
}
