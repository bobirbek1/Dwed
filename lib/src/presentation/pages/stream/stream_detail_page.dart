// ignore_for_file: must_be_immutable

import 'package:chewie/chewie.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:get/get.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/stream_controller/stream_controller.dart';
import 'package:flutter_template/src/presentation/widgets/stream/stream_tag.dart';
import 'package:intl/intl.dart';

class StreamDetailsPage extends StatelessWidget {
  StreamDetailsPage({Key? key}) : super(key: key);

  final _controller = Get.find<StreamController>();

  @override
  Widget build(BuildContext context) {
    _controller.getStreamDetails();
    Get.routing.route?.popped.then((value) {
      _controller.onBackFromDetails();
    });
    Get.log("${Get.routing.route}");
    return GetBuilder(
        init: _controller,
        id: _controller.streamDetailsId,
        builder: (context) {
          return Scaffold(
            appBar: getAppBar(
                IconButton(
                    onPressed: () {
                      _controller.videoController?.pause();
                      Get.back();
                    },
                    icon: SvgPicture.asset(
                      AppIcons.ARROW_LEFT,
                      color: Colors.black,
                    )),
                _controller.selectedStream?.channelName ?? "Stream"),
            body: Column(
              children: [
                Container(
                  height: SizeConfig.calculateBlockVertical(240),
                  color: AppColors.BLACK,
                  child: Chewie(
                    controller: _controller.chewieController!,
                    
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      getStreamDetails(),
                      getMessageScreen(),
                    ],
                  ),
                ),
                // _controller.isMessagePressed
                //     ? getMessageScreen()
                //     : getStreamDetails()
              ],
            ),
            floatingActionButton: AnimatedScale(
              duration: const Duration(
                milliseconds: 500,
              ),
              curve: Curves.fastOutSlowIn,
              scale: _controller.isMessagePressed ? 0 : 1,
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                onPressed: !_controller.isMessagePressed
                    ? () {
                        _controller.isMessagePressed =
                            !_controller.isMessagePressed;
                      }
                    : null,
                child: SvgPicture.asset(AppIcons.ICON_MESSAGE),
              ),
            ),
          );
        });
  }

  getAppBar(Widget leading, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.3,
      leading: leading,
      title: Container(
        padding: EdgeInsets.zero,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(
            top: 4,
            bottom: 4,
            left: SizeConfig.calculateBlockHorizontal(16),
            right: SizeConfig.calculateBlockHorizontal(6),
          ),
          child: Transform.scale(
            scale: 0.5,
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.ICON_MORE,
                  color: Colors.black,
                )),
          ),
        )
      ],
    );
  }

  getStreamDetails() {
    final data = _controller.streamDetails;
    return _controller.streamDetailsState == StreamState.loading
        ? const Center(child: CircularProgressIndicator.adaptive())
        : _controller.streamDetailsState == StreamState.error
            ? const Center(
                child: Text("There is some problem while fetching data."),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.calculateBlockHorizontal(48),
                          height: SizeConfig.calculateBlockVertical(48),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(data?.thumbnail ?? ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data?.channelName ?? "- - - -",
                                style: const TextStyle(
                                    color: AppColors.BLACK,
                                    fontSize: 16,
                                    height: 1.2),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      data?.user?.fullName ?? "- - - -",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.MAIN_TEXT_COLOR),
                                    ),
                                    // Expanded(child: Container()),
                                    const Expanded(child: SizedBox()),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          SvgPicture.asset(AppIcons.ICON_EYE),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            data?.liveWatchers.toString() ??
                                                "0",
                                            style: const TextStyle(
                                                color: AppColors.BLACK,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ]),
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(children: const [
                                StreamTag(tag: "Math"),
                                SizedBox(
                                  width: 4,
                                ),
                                StreamTag(tag: "Beginner"),
                                SizedBox(
                                  width: 4,
                                ),
                                StreamTag(tag: "Uzbek"),
                              ])
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(
                          color: AppColors.BLACK,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Text(
                          data?.channelDescription ??
                              "There is no description for this channel!",
                          // maxLines: flagText ? 8 : 5,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Today Schedule",
                      style: TextStyle(
                          color: AppColors.BLACK,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.2),
                      maxLines: 1,
                    ),
                  ],
                ),
              );
  }

  getMessageScreen() {
    return GetBuilder(
        init: _controller,
        id: _controller.chatId,
        builder: (context) {
          return AnimatedScale(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            scale: _controller.isMessagePressed ? 1 : 0,
            alignment: Alignment.bottomCenter,
            child: Container(
              color: AppColors.WHITE,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: AppColors.WHITE,
                    automaticallyImplyLeading: false,
                    title: const Text(
                      "Live Chat",
                      style: TextStyle(
                          color: AppColors.BLACK,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {
                            _controller.isMessagePressed =
                                !_controller.isMessagePressed;
                          },
                          icon: SvgPicture.asset(
                            AppIcons.ARROW_DOWN,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  if (_controller.chatState == StreamState.loading &&
                      _controller.chatMessages.isEmpty)
                    const Expanded(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  if (_controller.chatState == StreamState.loaded ||
                      _controller.chatMessages.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                          itemCount: _controller
                              .chatMessages[
                                  _controller.selectedStream?.channelSlug]
                              ?.length,
                          reverse: true,
                          controller: _controller.scrollController,
                          itemBuilder: (_, int index) {
                            final length = _controller
                                .chatMessages[
                                    _controller.selectedStream?.channelSlug]
                                ?.length ?? 0;
                            final message = _controller.chatMessages[
                                    _controller.selectedStream?.channelSlug]
                                ?[length - 1 - index];
                            return getStreamChatList(
                                message?.user?.avatar,
                                message?.user?.fullName,
                                message?.text,
                                message?.date);
                          }),
                    ),
                  if (_controller.chatState == StreamState.loaded &&
                      _controller.chatMessages.isEmpty)
                    const Expanded(child: Text("No messages yet!")),
                  if (_controller.chatState == StreamState.loaded)
                    buildBottomMessageBar()
                ],
              ),
            ),
          );
        });
  }

  getStreamChatList(
      String? profileImage, String? name, String? message, String? time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: SizeConfig.calculateBlockHorizontal(48),
            height: SizeConfig.calculateBlockVertical(48),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: profileImage != null
                  ? DecorationImage(
                      image: NetworkImage(profileImage), fit: BoxFit.cover)
                  : null,
            ),
            child: profileImage == null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(
                      60,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.PLACE_HOLDER,
                      fit: BoxFit.cover,
                    ),
                  )
                : null,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name ?? "- - - -",
                      style: const TextStyle(
                          color: AppColors.BLACK,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      getTime(time),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.SHADOW_BLUE,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  message ?? "- - - -",
                  style: const TextStyle(
                      color: AppColors.BLACK,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // getStreamChatList(
  //     String profileImage, String name, String message, int time) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 16),
  //     margin: const EdgeInsets.only(top: 12),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           width: SizeConfig.calculateBlockHorizontal(48),
  //           height: SizeConfig.calculateBlockVertical(48),
  //           alignment: Alignment.topCenter,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(24),
  //               image: DecorationImage(
  //                   image: NetworkImage(profileImage), fit: BoxFit.cover)),
  //         ),
  //         const SizedBox(
  //           width: 8,
  //         ),
  //         Expanded(
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     name,
  //                     style: const TextStyle(
  //                         color: AppColors.BLACK,
  //                         fontWeight: FontWeight.w700,
  //                         fontSize: 14),
  //                   ),
  //                   const SizedBox(
  //                     width: 5,
  //                   ),
  //                   Text("${time}m")
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 4,
  //               ),
  //               Text(
  //                 message,
  //                 style: const TextStyle(
  //                     color: AppColors.BLACK,
  //                     fontWeight: FontWeight.w400,
  //                     fontSize: 14),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  buildBottomMessageBar() {
    return Material(
      elevation: 8,
      child: Container(
        height: SizeConfig.calculateBlockVertical(64),
        padding: const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 8),
        margin: const EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.BACKGROUND,
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            controller: _controller.messageTextController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: false,
              prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppIcons.ICON_SMILE)),
              suffixIcon: GetBuilder(
                init: _controller,
                id: _controller.messageSendId,
                builder: (ctrl) {
                  return Padding(
                    padding: EdgeInsets.all(
                        _controller.messageTextController.text.isNotEmpty
                            ? 4
                            : 10),
                    child: !_controller.hasText
                        ? SvgPicture.asset(AppIcons.ICON_DOLLOR)
                        : InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            onTap: () {
                              Get.log("message is sended");
                              _controller.sendChatMessage();
                            },
                            splashColor: Colors.blue,
                            child: const Icon(
                              Icons.send,
                              color: AppColors.BUTTON_BLUE,
                            ),
                          ),
                  );
                },
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  getTime(String? time) {
    if (time == null) {
      return "-";
    }
    final date = DateTime.parse(time).toLocal();
    final today = DateTime.now();
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      if (date.hour == today.hour && date.minute == today.minute) {
        return "less than 1 min";
      } else if (date.hour == today.hour) {
        return "${today.minute - date.minute} min";
      } else {
        return "${today.hour - date.hour} hour";
      }
    } else {
      return DateFormat("dd.MM.yyyy").format(date);
    }
  }
}
