import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';

class StreamTag extends StatelessWidget {
  final String tag;
  const StreamTag({required this.tag, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.GRAY_X11),
      child: Text(
        tag,
        style: const TextStyle(color: AppColors.MAIN_TEXT_COLOR, fontSize: 12),
      ),
    );
  }
}
