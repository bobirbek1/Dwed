import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Indicator extends StatelessWidget {
  Indicator({
    required this.controller,
    this.itemCount = 0,
  });

  /// PageView Controller
  final PageController controller;

  /// Number of indicators
  final int itemCount;

  /// Ordinary colours
  final Color normalColor = Colors.blue.withOpacity(0.3);

  /// Selected color
  final Color selectedColor = Colors.blue;

  /// Size of points
  final double size = 8.0;

  /// Spacing of points
  final double spacing = 4.0;

  /// Point Widget
  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // Is the current page selected?
    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page!.round() % pageCount : 0);

    return Container(
      height: size,
      width: size + (2 * spacing),
      child: Center(
        child: Material(
          color: isCurrentPageSelected ? selectedColor : normalColor,
          type: MaterialType.circle,
          child: SvgPicture.asset(
            "assets/icons/Rectangle 951.svg",
            color: isCurrentPageSelected ? selectedColor : normalColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}
