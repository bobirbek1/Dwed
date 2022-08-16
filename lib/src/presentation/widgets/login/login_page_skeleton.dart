import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

class LoginPageSkeleton extends StatelessWidget {
  final double headerHeight;
  final String? title;
  final String? subtitle;
  final String? bodyTitle;
  final String? bodySubtitle;
  final bool canBack;
  final Widget child;

  const LoginPageSkeleton(
      {required this.child,
      this.canBack = false,
      this.headerHeight = 286,
      this.title,
      this.subtitle,
      this.bodyTitle,
      this.bodySubtitle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          SizeConfig.calculateBlockVertical(headerHeight),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          width: double.infinity,
          height: 286,
          padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (canBack) InkWell(child: SvgPicture.asset(AppIcons.ARROW_LEFT),onTap: (){
                    Get.back();
                  },),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const Text(
                    "English",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: SvgPicture.asset(
                  AppIcons.LOGO,
                  fit: BoxFit.scaleDown,
                  color: Colors.white,
                ),
              ),
              if (title != null || subtitle != null)
                const SizedBox(
                  height: 24,
                ),
              if (title != null)
                Text(
                  title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              if (subtitle != null && title != null)
                const SizedBox(
                  height: 12,
                ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              if (bodyTitle != null)
                const SizedBox(
                  height: 32,
                ),
              if (bodyTitle != null)
                Text(
                  bodyTitle!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (bodySubtitle != null)
                const SizedBox(
                  height: 12,
                ),
              if (bodySubtitle != null)
                Text(
                  bodySubtitle!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
