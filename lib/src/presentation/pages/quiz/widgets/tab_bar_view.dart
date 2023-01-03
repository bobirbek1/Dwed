import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/quiz/user_profile/main_controller.dart';
import 'package:flutter_template/src/presentation/pages/search/search_page.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../app/app_icons.dart';

class QuizTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizTabBarState();
  }
}

class QuizTabBarState extends State<QuizTabBar>
    with SingleTickerProviderStateMixin {
  final _controller = Get.find<MainController>();
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        elevation: 1,
        leading: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.calculateBlockHorizontal(16),
                right: SizeConfig.calculateBlockHorizontal(6),
              ),
              child: SvgPicture.asset(AppIcons.SHAPE),
            ),
            SvgPicture.asset(
              AppIcons.DWED,
              height: SizeConfig.calculateBlockVertical(11),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.black54,
            labelColor: Colors.blue,
            tabs: const [
              Tab(
                icon: Text(
                  "Quiz",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Tab(
                icon: Text(
                  "Streams",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [getCategories(), SearchPage()]),
          )
        ],
      ),
    );
  }

  Widget getCategories() {
    return GetBuilder(
        init: _controller,
        id: _controller.catId,
        builder: (context) {
          if (_controller.catState == MainState.initial) {
            _controller.onRefresh();
          }
          return SmartRefresher(
            controller: _controller.refreshController,
            onRefresh: _controller.onRefresh,
            onLoading: _controller.onLoading,
            enablePullUp: true,
            enablePullDown: true,
            child: _controller.catState == MainState.loading
                ? const Center(
                    child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        )),
                  )
                : _controller.catState == MainState.loaded &&
                        _controller.list.isEmpty
                    ? Center(
                        child: Column(
                          children: const [
                            Text(
                              "No Quiz",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _controller.list.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16, top: 16),
                            child: InkWell(
                              onTap: () {
                                _controller.onCatItemPressed(index);
                              },
                              child: SizedBox(
                                  width: double.infinity,
                                  height: SizeConfig.calculateBlockVertical(64),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            SizeConfig.calculateBlockHorizontal(
                                                56),
                                        height:
                                            SizeConfig.calculateBlockVertical(
                                                56),
                                        child: Image.asset(
                                            AppImages.PLACE_HOLDER_AKHROR),
                                      ),
                                      SizedBox(
                                        width:
                                            SizeConfig.calculateBlockVertical(
                                                16),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _controller.list[index].name ??
                                                    "no name",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              ),
                                              const Text(
                                                "",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: 1,
                                            color: AppColors.GRAY_X11,
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          );
                        }),
          );
        });
  }

  getStreams() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: SizedBox(
                height: SizeConfig.calculateBlockVertical(64),
                child: Column(
                  children: [
                    const SizedBox(),
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.calculateBlockHorizontal(56),
                          height: SizeConfig.calculateBlockVertical(56),
                          child: Image.asset(
                            AppImages.DACHA,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.calculateBlockVertical(16),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Education",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Text(
                              "1200 quiz",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
          );
        });
  }
}
