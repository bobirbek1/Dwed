// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class CounterWidget extends StatefulWidget {
  int count;
  final Function add;
  final Function remove;
  final Function delete;

  CounterWidget(
      {Key? key,
      required this.count,
      required this.add,
      required this.remove,
      required this.delete})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CounterWidgetState();
  }
}

class CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    int total = widget.count;

    return Row(
      children: [
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(24),
          height: SizeConfig.calculateBlockVertical(24),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                total = widget.add();
              });
            },
            style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
              "-",
              style: TextStyle(fontSize: 16, color: AppColors.BLACK),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(16),
        ),
        Text(total.toString()),
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(16),
        ),
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(24),
          height: SizeConfig.calculateBlockVertical(24),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                total = widget.remove();
              });
            },
            style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
              "+",
              style: TextStyle(fontSize: 16, color: AppColors.BLACK),
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        InkWell(
          child: Image.asset('assets/images/trash.png'),
          onTap: () {
            widget.delete();
            setState(() {
              total = 0;
            });
          },
        )
      ],
    );
  }
}
