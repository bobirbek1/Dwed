import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:get/get.dart';



class DotIndicator extends AnimatedWidget {
  final PageController pageController;
  final Size dotSize;
  final double spacing;
  final int count;

  const DotIndicator(
      {Key? key,
      required this.count,
      required this.dotSize,
      required this.spacing,
      required this.pageController})
      : super(key: key, listenable: pageController);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(count, (index) => _buildDot(index)),
    );
  }

  _buildDot(int index) {
    double opacity = 1.0 -
        (0.8 *
            ((pageController.page ?? pageController.initialPage) - index)
                .abs());
    if (opacity < 0.2) opacity = 0.2;
    return Container(
      width: dotSize.width,
      height: dotSize.height,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing / 2),
        color: AppColors.WHITE.withOpacity(opacity),
      ),
    );
  }
}
