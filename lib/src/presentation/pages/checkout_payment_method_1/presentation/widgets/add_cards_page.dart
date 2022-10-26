import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class AddCardsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddCardsWidgetState();
  }

}

class AddCardsWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.calculateBlockVertical(376),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height : SizeConfig.calculateBlockVertical(8)),

            const Text('Add Cards', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),

            SizedBox(height : SizeConfig.calculateBlockVertical(24)),

            buildContainer(getFirstField()),

            SizedBox(height : SizeConfig.calculateBlockVertical(16)),

            buildContainer(getSecondField()),

            SizedBox(height : SizeConfig.calculateBlockVertical(16)),

            buildContainer(getThirdField()),

            SizedBox(height : SizeConfig.calculateBlockVertical(16)),

            buildBottomButton()
          ],
        ),
      ),
    );
  }
  Widget getThirdField() {
    return Row(
      children: const [
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            style: TextStyle(
                color: Colors.white
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Karta nomi',
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget getSecondField() {
    return Row(
      children: const [
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            style: TextStyle(
                color: Colors.white
            ),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Amal qilish muddati',
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getFirstField() {
    return Container(
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              cursorColor: Colors.black,
              style: TextStyle(
                  color: Colors.black87
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Karta raqami',
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
              ),
            ),
          ),

          Image.asset('assets/images/uzcart_logo.png'),

          SizedBox(width: SizeConfig.calculateBlockHorizontal(16),),
        ],
      ),
    );
  }

  Widget buildContainer(Widget widget) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: widget,
      height: 56,
      width: double.infinity,
    );
  }

  Widget buildBottomButton() {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.calculateBlockVertical(56),
      child: ElevatedButton(
        onPressed: () {

        },
        child: const Text('Checkout'),
      ),
    );
  }

}

