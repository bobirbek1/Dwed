

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:get/get.dart';

import '../../../../app/app_icons.dart';
import '../../../../core/utils/size_config.dart';

class StreamDetailsPage extends StatelessWidget {
  StreamDetailsPage({Key? key}) : super(key: key);

  bool isMessagePressed = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.ARROW_LEFT,
                color: Colors.black,
              )),
          'Stream name'),
      body: Column(
        children: [
          Container(
            height: SizeConfig.calculateBlockVertical(240),
            decoration: const BoxDecoration(color: AppColors.ROYAL_ORANGE),
          ),
          isMessagePressed ? getMessageScreen() : getStreamDetails()
        ],
      ),
      floatingActionButton: Visibility(
        visible: isMessagePressed ? false : true,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            isMessagePressed = !isMessagePressed;
          },
          child: SvgPicture.asset(AppIcons.ICON_MESSAGE),
        ),
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
    const String descText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis magna orci, sit accumsan scelerisqe. Vehicula arcu, scelerisque id in. Velit, iaculis sem purus lobortis. Adipiscing quam egestas odio habitant eget massa. Suspendisse proin et diam tellus arcu...more";
    bool flagText = false;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: SizeConfig.calculateBlockHorizontal(48),
                  height: SizeConfig.calculateBlockVertical(48),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(48)),
                  child: Image.asset(AppImages.PHONES_PHONES)),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Lorem ipsum dolor sit amet, consec adipiscing elit Non",
                      style: TextStyle(
                          color: AppColors.BLACK, fontSize: 16, height: 1.2),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      const Text(
                        "T-MED",
                        style: TextStyle(
                            fontSize: 16, color: AppColors.MAIN_TEXT_COLOR),
                      ),
                      // Expanded(child: Container()),
                      const Expanded(child: SizedBox()),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SvgPicture.asset(AppIcons.ICON_EYE),
                            const Text(
                              "10.5K",
                              style: TextStyle(
                                  color: AppColors.BLACK,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )
                          ]),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(children: [
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 4, top: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.GRAY_X11),
                        child: const Text(
                          "Math",
                          style: TextStyle(
                              color: AppColors.MAIN_TEXT_COLOR, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 4, top: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.GRAY_X11),
                        child: const Text(
                          "Beginner",
                          style: TextStyle(
                              color: AppColors.MAIN_TEXT_COLOR, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 4, top: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.GRAY_X11),
                        child: const Text(
                          "Uzbek",
                          style: TextStyle(
                              color: AppColors.MAIN_TEXT_COLOR, fontSize: 12),
                        ),
                      ),
                    ]),
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
                descText,
                maxLines: flagText ? 8 : 5,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
              GestureDetector(
                onTap: () {
                  flagText = !flagText;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    flagText
                        ? const Text(
                            "less",
                            style: TextStyle(color: Colors.blue),
                          )
                        : const Text("more",
                            style: TextStyle(color: Colors.blue))
                  ],
                ),
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
    return Expanded(
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
                    Get.back();
                  },
                  icon: SvgPicture.asset(
                    AppIcons.ARROW_DOWN,
                    color: Colors.black,
                  )),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (_, int index) {
                  return getStreamChatList(
                      "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef",
                      "Ashlynn Lubin",
                      "If we program the program, we can get to the AI monitor through the online THX interface!",
                      4);
                }),
          ),
          // const SizedBox(height: 64,),
          buildBottomMessageBar()
        ],
      ),
    );
  }

  getStreamChatList(
      String profileImage, String name, String message, int time) {
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
                image: DecorationImage(
                    image: NetworkImage(profileImage), fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: AppColors.BLACK,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${time}m")
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  message,
                  style: const TextStyle(
                      color: AppColors.BLACK,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buildBottomMessageBar() {
    return Material(
      elevation: 8,
      child: SizedBox(
        height: SizeConfig.calculateBlockVertical(64),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.BACKGROUND,
                borderRadius: BorderRadius.circular(8)),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(AppIcons.ICON_SMILE)),
                suffixIcon: Padding(
                    padding:  EdgeInsets.all( _textEditingController.text.isNotEmpty ? 4:10),
                    child: _textEditingController.text.isEmpty
                        ? SvgPicture.asset(AppIcons.ICON_DOLLOR)
                        : InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      onTap: (){
                        Get.log("message is sended");
                      },
                        splashColor: Colors.blue,
                        child:const Icon(Icons.send)
                )),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
