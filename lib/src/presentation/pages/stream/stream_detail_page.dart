// ignore_for_file: must_be_immutable

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/presentation/controller/stream_controller/stream_controller.dart';
import 'package:flutter_template/src/presentation/widgets/stream/stream_tag.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class StreamDetailsPage extends StatelessWidget {
  StreamDetailsPage({Key? key}) : super(key: key);

  final _controller = Get.find<StreamController>();

  bool isMessagePressed = false;

  @override
  Widget build(BuildContext context) {
    _controller.getStreamDetails();
   
    return Scaffold(
      appBar: getAppBar(
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(
                AppIcons.ARROW_LEFT,
                color: Colors.black,
              )),
          'Stream name'),
      body: GetBuilder(
          init: _controller,
          id: _controller.streamDetailsId,
          builder: (ctrl) {
            return Column(
              children: [
                Container(
                  height: SizeConfig.calculateBlockVertical(240),
                  decoration:
                      const BoxDecoration(color: AppColors.ROYAL_ORANGE),
                  child: Chewie(
                    controller: _controller.chewieController,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                isMessagePressed ? getMessageScreen() : getStreamDetails()
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          isMessagePressed = !isMessagePressed;
        },
        child: SvgPicture.asset(AppIcons.ICON_MESSAGE),
      ),
    );
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
                                height: 8,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.calculateBlockVertical(56),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Live Chat",
                  style: TextStyle(
                      color: AppColors.BLACK, fontSize: 16, height: 1.2),
                ),
                Transform.scale(
                  scale: 0.5,
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppIcons.ARROW_DOWN,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
          ListView.builder(itemBuilder: (_, int index) {
            return getStreamChatList(
                "https://www.google.com/imgres?imgurl=https%3A%2F%2Foecdenvironmentfocusblog.files.wordpress.com%2F2020%2F06%2Fwed-blog-shutterstock_1703194387_low_nwm.jpg&imgrefurl=https%3A%2F%2Foecd-environment-focus.blog%2F2020%2F06%2F05%2Ftime-for-nature-is-a-global-public-health-crisis-what-it-takes-to-protect-the-planets-biodiversity%2F&tbnid=mxmAv-yoofVX-M&vet=12ahUKEwiwkuOboaD7AhU50LsIHRMqCbkQMyhlegUIARDZAQ..i&docid=Dtq-qGkM6AowdM&w=500&h=262&q=nature&ved=2ahUKEwiwkuOboaD7AhU50LsIHRMqCbkQMyhlegUIARDZAQ",
                "name",
                "message",
                4);
          })
        ],
      ),
    );
  }

  getStreamChatList(
      String profileImage, String name, String message, int time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: SizeConfig.calculateBlockHorizontal(48),
          height: SizeConfig.calculateBlockVertical(48),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: Image.network(profileImage),
        )
      ],
    );
  }
}
