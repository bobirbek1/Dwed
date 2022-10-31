import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/pages/basket/basket_page.dart';
import 'package:flutter_template/src/presentation/pages/cart/presentation/pages/cart_page.dart';
import 'package:flutter_template/src/presentation/pages/home/home_page.dart';
import 'package:flutter_template/src/presentation/pages/news/news_page.dart';
import 'package:flutter_template/src/presentation/pages/profile/profile_page.dart';
import 'package:flutter_template/src/presentation/pages/search/search_page.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  var _currentTabIndex = 0;

  final List<Widget> _tabs = [
    HomePage(),
    SearchPage(),
    NewsPage(),
    CartPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _tabs[_currentTabIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: getBottomBar(),
          ),
        ],
      ),
    );
  }

  void showBottomSheet(context, {required Widget child}) {
    showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.3),
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      builder: (context) => child,
      // BottomModalSheet(
      //   child: child,
      // ),
    );
  }

  getCustomIconButton({
    required int index,
    iconPressed,
    defaultIcons,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: _currentTabIndex == index
            ? null
            : () => setState(() {
                  _currentTabIndex = index;
                }),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _currentTabIndex == index
                ? iconPressed[index]
                : defaultIcons[index],
              
          ],
        ),
      ),
    );
  }

  getCustomIcon(String assetName, {bool isPressed = false}) {
    return SvgPicture.asset(
      assetName,
      width: SizeConfig.calculateBlockHorizontal(24),
      height: SizeConfig.calculateBlockVertical(24),
      color: isPressed ? AppColors.BUTTON_BLUE : AppColors.BLACK,
    );
  }

  getBottomBar() {
    List<Widget> defaultIcons = [
      getCustomIcon(AppIcons.CATEGORY_1),
      getCustomIcon(AppIcons.CATEGORY_2),
      getCustomIcon(AppIcons.CATEGORY_3),
      getCustomIcon(AppIcons.CATEGORY_4),
      getCustomIcon(AppIcons.CATEGORY_5),
    ];

    List<Widget> iconPressed = [
      getCustomIcon(AppIcons.CATEGORY_1, isPressed: true),
      getCustomIcon(AppIcons.CATEGORY_2, isPressed: true),
      getCustomIcon(AppIcons.CATEGORY_3, isPressed: true),
      getCustomIcon(AppIcons.CATEGORY_4, isPressed: true),
      getCustomIcon(AppIcons.CATEGORY_5, isPressed: true),
    ];
    return Container(
      height: SizeConfig.calculateBlockVertical(72),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.calculateBlockHorizontal(10),
        vertical: SizeConfig.calculateBlockVertical(18),
      ),
      // margin: EdgeInsets.only(
      //   left: SizeConfig.calculateBlockHorizontal(12),
      //   right: SizeConfig.calculateBlockHorizontal(12),
        // bottom: SizeConfig.calculateBlockVertical(30),
      // ),
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        // borderRadius: BorderRadius.circular(20),
        boxShadow: [
         if (_currentTabIndex != 3) BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 6,
            blurRadius: 2,
            offset: const Offset(0, 0.5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getCustomIconButton(
            index: 0,
            iconPressed: iconPressed,
            defaultIcons: defaultIcons,
          ),
          getCustomIconButton(
            index: 1,
            iconPressed: iconPressed,
            defaultIcons: defaultIcons,
          ),
          getCustomIconButton(
            index: 2,
            iconPressed: iconPressed,
            defaultIcons: defaultIcons,
          ),
          getCustomIconButton(
            index: 3,
            iconPressed: iconPressed,
            defaultIcons: defaultIcons,
          ),
          getCustomIconButton(
            index: 4,
            iconPressed: iconPressed,
            defaultIcons: defaultIcons,
          ),
        ],
      ),
    );
  }
}
