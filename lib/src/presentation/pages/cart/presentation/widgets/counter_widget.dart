import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class CounterWidget extends StatefulWidget {
  int count;
  final Function add;
  final Function remove;
  final Function delete;

  CounterWidget({
    required this.count,
    required this.add,
    required this.remove,
    required this.delete
  });

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
              child: Image.asset('assets/images/plus.png')),
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
            child: Image.asset('assets/images/minus.png'),
          ),
        ),

        const Expanded(child: SizedBox()),

        InkWell(child: Image.asset('assets/images/trash.png'),onTap: (){
          widget.delete();
          setState(() { total = 0; });
          },)
      ],
    );
  }

}