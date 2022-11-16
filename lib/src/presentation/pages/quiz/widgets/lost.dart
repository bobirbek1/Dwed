import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';

class LostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16.0, right: 16),
      child: Column(
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(16),
          ),


          const Text(
            'your opponent won the game!',

            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black12 ),
          ),
          const Text(
            'you won , congratulations! jcsannac jsnca snsc sjna nsa xj sa xjsa xj an ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black12 ),
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(24),
          ),

          const Text(
            'you won , congratulations! jcsannac jsnca snsc sjna nsa xj sa xjsa xj an ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.blue ),
          ),
        ],
      ),
    );
  }

}