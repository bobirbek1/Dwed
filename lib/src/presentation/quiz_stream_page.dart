import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/quiz/quiz_category_controller.dart';
import 'package:flutter_template/src/presentation/pages/quiz/my_profile.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/lost.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/quiz_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class QuizStreamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizStreamPageState();
  }
}

class QuizStreamPageState extends State<QuizStreamPage>
    with TickerProviderStateMixin {
  int _selectedPage = 0;
  int _bottomSelectedPage = 0;
  TabController? _tabController;
  final _controller = Get.find<QuizCategoryController>();

  @override
  void initState() {
    _tabController = TabController( vsync: this, length: 2, animationDuration: Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.WHITE,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(AppImages.LOGO_DWED),
        ),
        actions: [
          SizedBox(
              width: SizeConfig.calculateBlockHorizontal(24),
              height: SizeConfig.calculateBlockVertical(24),
              child: Image.asset(AppImages.SEARCH_NORMAL)),
          SizedBox(
            width: SizeConfig.calculateBlockHorizontal(16),
          )
        ],
      ),
      body:_bottomSelectedPage == 0 ? SizedBox() : MyProfilePage(),
      bottomNavigationBar: getBottomNavigation(),
    );
  }

  getAppBar() {
    return Container(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: SizeConfig.calculateBlockVertical(56),
        width: double.infinity,
        child: Row(
          children: [
            Image.asset(AppImages.LOGO_DWED),
            const Expanded(child: SizedBox()),
            Image.asset(AppImages.SEARCH_NORMAL)
          ],
        ),
      ),
    );
  }

  getCategory() {
    return Container(
      color: Colors.white,
      height: SizeConfig.calculateBlockVertical(56),
      width: SizeConfig.calculateBlockHorizontal(56),
      child: Row(
        children: [],
      ),
    );
  }

  getBottomNavigation() {
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _bottomSelectedPage = index;
          });
        },
        currentIndex: _bottomSelectedPage,
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                  width: SizeConfig.calculateBlockHorizontal(24),
                  height: SizeConfig.calculateBlockVertical(24),
                  child: Image.asset(AppImages.CATEGORY_MAIN)),
              label: " "),
          BottomNavigationBarItem(
              icon: Container(
                width: SizeConfig.calculateBlockHorizontal(24),
                height: SizeConfig.calculateBlockVertical(24),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(AppImages.DACHA), fit: BoxFit.cover)),
              ),
              label: " ")
        ]);
  }

  getTabLayout() {
    return TabBar(
      controller: _tabController,
      onTap: (index) {
        setState(() {
          _selectedPage = index;
        });
      },
      tabs: const [
        Tab(
          child: Text(
            'Quiz',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Streams',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  getTabView() {
    return TabBarView(
        controller: _tabController, children: [QuizWidget(), MyProfilePage()]);
  }
}
