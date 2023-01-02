import 'package:flutter/material.dart';
import 'package:flutter_template/src/presentation/controller/quiz/user_profile/quiz_history_controller.dart';
import 'package:flutter_template/src/presentation/pages/quiz/widgets/game_not_found.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../app/app_images.dart';
import '../../../../core/utils/size_config.dart';

class PlayerInformationPage extends StatelessWidget {
  final _controller = Get.find<QuizHistoryController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: getLeading(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'History',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.calculateTextSize(16),
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: GetBuilder(
                  init: _controller,
                  id: _controller.listId,
                  builder: (context) {
                    if (_controller.listState == HistoryPageState.initial) {
                      _controller.onRefresh();
                    }
                    return SmartRefresher(
                        controller: _controller.refreshController,
                        onLoading: _controller.onLoading,
                        onRefresh: _controller.onRefresh,
                        enablePullDown: true,
                        enablePullUp: true,
                        child: _controller.listState ==
                                    HistoryPageState.loaded &&
                                _controller.list.isNotEmpty
                            ? ListView.builder(
                                itemCount: _controller.list.length,
                                itemBuilder: (_, index) {
                                  return getItem(index);
                                },
                              )
                            : _controller.listState ==
                                        HistoryPageState.loaded &&
                                    _controller.list.isNotEmpty
                                ? getPicture()
                                : _controller.listState ==
                                        HistoryPageState.loading
                                    ? const Center(
                                        child: SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: CircularProgressIndicator(),
                                        ),
                                      ) : getPicture()
                                    // : const Center(
                                    //     child: Text(
                                    //       "ERROR",
                                    //       style: TextStyle(
                                    //           fontSize: 25,
                                    //           fontWeight: FontWeight.w500,
                                    //           color: Colors.black),
                                    //     ),
                                    //   )
                    );
                  })),
          buildBottomButton()
        ],
      ),
    );
  }

  getLeading() {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.calculateBlockHorizontal(16),
        ),
        InkWell(
          onTap: () {
            _controller.backPressed();
          },
          child: SizedBox(
            child: Image.asset(AppImages.APP_BAR_LEFT),
            height: SizeConfig.calculateBlockHorizontal(16),
            width: SizeConfig.calculateBlockHorizontal(24),
          ),
        )
      ],
    );
  }

  getItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              '${index + 1} - КВИЗ',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(12),
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              '# ${_controller.list[index].id ?? "no id"}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'uchastvo : ${_controller.list[index].participantNumber ?? 0}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Pobeditel : ${_controller.list[index].winner ?? "no winner"}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'pravilno otvetili : ${_controller.list[index].participantNumber ?? 0} / ${_controller.list[index].winnerNumber ?? 0}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'ne otvetili: ${_controller.list[index].participantWithoutPlace ?? 0}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'data : ${DateTime.parse(_controller.list[index].createDate ?? '2020-01-02T07:12:50+07:00').day} / ${DateTime.parse(_controller.list[index].createDate ?? '2020-01-02T07:12:50+07:00').month} / ${DateTime.parse(_controller.list[index].createDate ?? '2020-01-02T07:12:50+07:00').year}  time : ${DateTime.parse(_controller.list[index].createDate ?? '2020-01-02T07:12:50+07:00').hour}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'dlitelnosti : ${_controller.list[index].questionTime ?? 00}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          _controller.list.length - 1 != index ? Container(
            height: 1,
            color: Colors.black45,
          ) : const SizedBox()
        ],
      ),
    );
  }

  buildBottomButton() {
    return Container(
        width: double.infinity,
        height: 56,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white, blurRadius: 10, offset: Offset(4, 8)),
          ],
        ),
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () {
              _controller.closeBtnPressed();
            },
            child: const Text('CLOSE'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
          ),
          width: double.infinity,
        ));
  }

  getPicture() {
    return GameNotFoundPage();
  }
}
