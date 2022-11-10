import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/app/app_images.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/src/data/model/stream/stream_model.dart';
import 'package:flutter_template/src/presentation/widgets/stream/stream_tag.dart';

class StreamItem extends StatelessWidget {
  final StreamModel stream;
  final Function() onPressed;
  const StreamItem({required this.stream, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(stream.thumbnail ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                        margin: const EdgeInsets.only(top: 8, left: 8),
                        padding: const EdgeInsets.only(
                            top: 3, left: 6, right: 6, bottom: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.RED),
                        child: const Text(
                          "Live",
                          style:
                              TextStyle(color: AppColors.WHITE, fontSize: 18),
                        )),
                  ),
                  Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: AppColors.MAIN_TEXT_COLOR,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "${stream.liveWatchers} Views",
                          style: const TextStyle(
                              fontSize: 18, color: AppColors.WHITE),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.calculateBlockHorizontal(48),
                    height: SizeConfig.calculateBlockVertical(48),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      image: DecorationImage(
                        image: (stream.logo != null
                            ? NetworkImage(stream.logo!)
                            : const AssetImage(AppImages.MATH)
                                as ImageProvider),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stream.channelName ?? "- - - -",
                          style: const TextStyle(
                              color: AppColors.BLACK, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          stream.category?.name ?? "- - - -",
                          style: const TextStyle(
                              color: AppColors.MAIN_TEXT_COLOR, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
