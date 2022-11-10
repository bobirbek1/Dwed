// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/src/presentation/controller/stream_controller/stream_controller.dart';
import 'package:flutter_template/src/presentation/widgets/stream/stream_item.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../app/app_icons.dart';
import '../../../../core/utils/size_config.dart';

class StreamPage extends StatelessWidget {
  final _controller = Get.find<StreamController>();

  StreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        _controller.typing
            ? Row(
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
              )
            : Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.calculateBlockHorizontal(16),
                      right: SizeConfig.calculateBlockHorizontal(6),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.calculateBlockVertical(12.5),
                          horizontal: SizeConfig.calculateBlockHorizontal(10),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.ARROW_LEFT,
                          color: AppColors.BLACK,
                          fit: BoxFit.cover,
                          height: SizeConfig.calculateBlockVertical(22),
                          width: SizeConfig.calculateBlockHorizontal(7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        _controller.typing
            ? const SizedBox()
            : TextField(
                controller: _controller.textController,
                cursorHeight: 24,
                onChanged: (val) {},
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.SHADOW_BLUE,
                  ),
                ),
              ),
        _controller.typing
            ? SizeConfig.calculateBlockHorizontal(100)
            : SizeConfig.calculateBlockHorizontal(55),
      ),
      body: Column(
        children: [
          getStreamCategoriesList(),
          GetBuilder(
            init: _controller,
            id: _controller.streamListId,
            builder: (ctrl) {
              return getStreamList();
            },
          ),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(72),
          ),
        ],
      ),
    );
  }

  getAppBar(Widget leading, Widget title, double leadingWidth) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.3,
      leading: leading,
      leadingWidth: leadingWidth,
      title: title,
      actions: [
        _controller.typing
            ? InkWell(
                onTap: () {},
                child: Padding(
                    padding: EdgeInsets.only(
                      right: SizeConfig.calculateBlockHorizontal(19),
                    ),
                    child: SvgPicture.asset(AppIcons.SEARCH_NORMAL)),
              )
            : _controller.textController.text.isEmpty
                ? const SizedBox()
                : InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: SizeConfig.calculateBlockHorizontal(19),
                      ),
                      child: SvgPicture.asset(AppIcons.CLOSE_SEARCHFIELD),
                    ),
                  ),
        Padding(
          padding: EdgeInsets.only(
            right: SizeConfig.calculateBlockHorizontal(19),
          ),
          child: SvgPicture.asset(AppIcons.FILTER),
        ),
      ],
    );
  }

  getStreamCategoriesList() {
    return SizedBox(
      height: 56,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 12,
          itemBuilder: (_, int index) {
            return getCategoriesList();
          }),
    );
  }

  getCategoriesList() {
    return InkWell(
      onTap: () {},
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.MAIN_TEXT_COLOR),
          ),
          child: const Text(
            "Categories",
            style: TextStyle(color: AppColors.MAIN_TEXT_COLOR, fontSize: 18),
          ),
        ),
      ),
    );
  }

  getStreamList() {
    if (_controller.streamListState == StreamState.loaded ||
        _controller.streamListState == StreamState.loading &&
            _controller.streamList.isNotEmpty) {
      return Expanded(
          child: SmartRefresher(
        controller: _controller.streamController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _controller.refreshStreamList,
        onLoading: _controller.loadStreamList,
        child: ListView.builder(
            itemCount: _controller.streamList.length,
            itemBuilder: (_, int index) {
              final data = _controller.streamList[index];
              return StreamItem(
                stream: data,
                onPressed: () {
                  _controller.selectedStream = _controller.streamList[index];
                  Get.toNamed(AppRoutes.STREAM_DETAIL_PAGE);
                },
              );
            }),
      ));
    } else if (_controller.streamListState == StreamState.loading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    } else {
      return const Center(
        child: Text("Something went wrong, please try again!"),
      );
    }
  }
}
