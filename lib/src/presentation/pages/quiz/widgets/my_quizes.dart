import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';

class MyQuiz extends StatelessWidget {
  List<Items> list = [
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
    Items(
        name: 'Woman fashion',
        image: AppImages.BEAUTY,
        participants: '1200 products'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: (_, index){
        return Text('salom');
      },
        itemCount: list.length,
      ),
    );
  }

}

class Items {
  final String image;
  final String name;
  final String participants;

  Items({
    required this.name,
    required this.image,
    required this.participants,
  });
}
