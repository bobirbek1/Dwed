import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_constants.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get.dart';

List<String> list = <String>["English", "Русский","O'zbek"];

class LoginPageSkeleton extends StatefulWidget {
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
  State<LoginPageSkeleton> createState() => _LoginPageSkeletonState();
}

class _LoginPageSkeletonState extends State<LoginPageSkeleton> {
  List locale = [
    {'name': "English", 'locale': Locale('en', 'US')},
    {'name': "Русский", 'locale': Locale('ru', 'RU')},
    {'name': "O'zbek", 'locale': Locale('uz', 'UZ')},
  ];

  updateLanguage(Locale locale) {
    Get.updateLocale(locale);
    Get.log(locale.toString());
  }

  String dropdownValue="English";

  @override
  void initState() {

    // SystemChrome.setSystemUIOverlayStyle(
    //     );
   dropdownValue="ingliz".tr;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              width: double.infinity,
              height: widget.headerHeight,
              padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (widget.canBack)
                        InkWell(
                          child: SvgPicture.asset(AppIcons.ARROW_LEFT),
                          onTap: () {
                            Get.back();
                          },
                        ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      DropdownButton<String>(
                        isDense: true,
                        value: dropdownValue,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.WHITE,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        underline: const SizedBox(),
                        dropdownColor: AppColors.WHITE,
                        elevation: 16,
                        // style: const TextStyle(color: AppColors.WHITE),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(
                                () {
                              dropdownValue=value!;
                              Get.log("current language---->$value");
                              if (value == locale[0]["name"]) {
                                updateLanguage(const Locale('en', 'US'));
                              } else if (value == locale[1]["name"]) {
                                updateLanguage(const Locale('ru', 'RU'));
                              } else {
                                updateLanguage(const Locale('uz', 'UZ'));
                              }
                            },
                          );
                        },
                        selectedItemBuilder: (BuildContext context) {
                          //<-- SEE HERE
                          return list.map((String value) {
                            return Text(
                              dropdownValue,
                              style: const TextStyle(
                                color: AppColors.WHITE,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          }).toList();
                        },
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:  const TextStyle(
                                color: AppColors.BLACK,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                      )
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
                  if (widget.title != null || widget.subtitle != null)
                    const SizedBox(
                      height: 24,
                    ),
                  if (widget.title != null)
                    Text(
                      widget.title!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  if (widget.subtitle != null && widget.title != null)
                    const SizedBox(
                      height: 12,
                    ),
                  if (widget.subtitle != null)
                    Text(
                      widget.subtitle!,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      if (widget.bodyTitle != null)
                        const SizedBox(
                          height: 32,
                        ),
                      if (widget.bodyTitle != null)
                        Text(
                          widget.bodyTitle!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (widget.bodySubtitle != null)
                        const SizedBox(
                          height: 12,
                        ),
                      if (widget.bodySubtitle != null)
                        Text(
                          widget.bodySubtitle!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      widget.child,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  getAppBar(){
    return AppBar(
      backgroundColor: AppColors.WHITE,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
