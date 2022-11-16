import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_icons.dart';
import 'package:flutter_template/core/utils/size_config.dart';

import '../../../../app/app_images.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return buildBody();
  }

  Widget buildBody() {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.calculateBlockVertical(68),
        ),

        ///profile picture
        SizedBox(
            height: SizeConfig.calculateBlockVertical(72),
            width: SizeConfig.calculateBlockHorizontal(72),
            child: const CircleAvatar(
              backgroundImage: AssetImage(AppImages.BORDER),
            )),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(8),
        ),

        ///Name  && Official
        Row(
          children: [
            const Expanded(child: SizedBox()),
            Text(
              "Eshadavlatov Umidjon",
              style: TextStyle(
                  fontSize: SizeConfig.calculateTextSize(18),
                  fontWeight: FontWeight.w500),
            ),
            SvgPicture.asset(AppIcons.ICON_OFFICIAL),
            const Expanded(child: SizedBox()),
          ],

        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(4),
        ),

        ///Position
        Text(
          'Salesman',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.calculateTextSize(16),
            color: Colors.black26
          ),
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(24),
        ),

        buildInformation(),

        buildHistory(),

        buildPayment(),

        buildSettings(),

        buildQuiz()
      ],
    );
  }

  Widget buildInformation() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.calculateBlockVertical(16),),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(64),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Information of Account",
                      style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(16),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(6),
                    ),
                    Expanded(
                      child: Text(
                        "change about",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(12),
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(5.5),)
                  ],
                ),

                const Expanded(child: SizedBox(),),

                SizedBox(width: SizeConfig.calculateBlockHorizontal(24.16),),

                /// Arrow Left
                SizedBox(
                  height: SizeConfig.calculateBlockVertical(17.34),
                  width: SizeConfig.calculateBlockHorizontal(8.6),
                    child: InkWell(onTap: () {}, child: Image.asset(AppImages.LEFT))),

              ],
            ),
          ),

          Container(height: 1,color: Colors.black26,)
        ],
      ),
    );
  }

  Widget buildHistory() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.calculateBlockVertical(16),),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(64),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "History of cash",
                      style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(16),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(6),
                    ),
                    Expanded(
                      child: Text(
                        "If you want to see detail of offers inside comment you can see it",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(12),
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(5.5),)
                  ],
                ),

                const Expanded(child: SizedBox(),),

                /// Arrow Left
                SizedBox(
                    height: SizeConfig.calculateBlockVertical(17.34),
                    width: SizeConfig.calculateBlockHorizontal(8.6),
                    child: InkWell(onTap: () {}, child: Image.asset(AppImages.LEFT))),

              ],
            ),
          ),

          Container(height: 1,color: Colors.black26,)
        ],
      ),
    );
  }

  Widget buildPayment() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.calculateBlockVertical(16),),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(64),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(16),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(6),
                    ),
                    Expanded(
                      child: Text(
                        "Select a payment method",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(12),
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(5.5),)
                  ],
                ),

                const Expanded(child: SizedBox(),),

                SizedBox(width: SizeConfig.calculateBlockHorizontal(24.16),),

                /// Arrow Left
                SizedBox(
                    height: SizeConfig.calculateBlockVertical(17.34),
                    width: SizeConfig.calculateBlockHorizontal(8.6),
                    child: InkWell(onTap: () {}, child: Image.asset(AppImages.LEFT))),

              ],
            ),
          ),

          Container(height: 1,color: Colors.black26,)
        ],
      ),
    );
  }

  Widget buildSettings() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.calculateBlockVertical(16),),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(64),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(16),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(6),
                    ),
                    Expanded(
                      child: Text(
                        'You can change notification, payment detail and, more',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(12),
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(5.5),)
                  ],
                ),

                const Expanded(child: SizedBox(),),

                SizedBox(width: SizeConfig.calculateBlockHorizontal(24.16),),

                /// Arrow Left
                SizedBox(
                    height: SizeConfig.calculateBlockVertical(17.34),
                    width: SizeConfig.calculateBlockHorizontal(8.6),
                    child: InkWell(onTap: () {}, child: Image.asset(AppImages.LEFT))),

              ],
            ),
          ),

          Container(height: 1,color: Colors.black26,)
        ],
      ),
    );
  }

  Widget buildQuiz() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.calculateBlockVertical(16),),
          SizedBox(
            height: SizeConfig.calculateBlockVertical(64),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quiz",
                      style: TextStyle(
                          fontSize: SizeConfig.calculateTextSize(16),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: SizeConfig.calculateBlockVertical(6),
                    ),
                    Expanded(
                      child: Text(
                        'You can change notification, payment detail and, more',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: SizeConfig.calculateTextSize(12),
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(5.5),)
                  ],
                ),

                const Expanded(child: SizedBox(),),

                SizedBox(width: SizeConfig.calculateBlockHorizontal(24.16),),

                /// Arrow Left
                SizedBox(
                    height: SizeConfig.calculateBlockVertical(17.34),
                    width: SizeConfig.calculateBlockHorizontal(8.6),
                    child: InkWell(onTap: () {}, child: Image.asset(AppImages.LEFT))),

              ],
            ),
          ),

          Container(height: 1,color: Colors.black26,)
        ],
      ),
    );
  }
}
