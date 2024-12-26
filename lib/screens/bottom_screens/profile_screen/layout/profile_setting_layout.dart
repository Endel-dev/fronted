import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/screens/bottom_screens/profile_screen/layout/profile_widget.dart';
import 'package:piggypaisa/screens/bottom_screens/profile_screen/layout/profilesetting_button_layout.dart';
import 'package:piggypaisa/screens/bottom_screens/profile_screen/layout/profilesetting_sublayout.dart';
import '../../../../common/assets/index.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../routes/index.dart';
import '../../../../widgets/direction_page.dart';

class ProfileSettingLayout extends StatelessWidget {
  const ProfileSettingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DirectionLayout(
        dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            body: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Column(children: [
                    Stack(children: [
                      ProfileWidget().topContainer(context),
                      // const VSpace(Sizes.s20),
                      Center(
                          child: Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.08),
                                  height: Sizes.s100,
                                  width: Sizes.s100,
                                  child: Image.asset(
                                      imageAssets.imageProfilePic,
                                      fit: BoxFit.fill))
                              .paddingOnly(
                                  left: Insets.i20,
                                  right: Insets.i20,
                                  bottom: Insets.i20)),
                      Center(
                          child: Container(
                                  height: Sizes.s26,
                                  width: Sizes.s26,
                                  //decoration
                                  decoration:
                                      ProfileWidget().decorEdit(context),
                                  padding: const EdgeInsets.all(Insets.i4),
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.162),
                                  child: SvgPicture.asset(svgAssets.iconEdit))
                              .paddingOnly(left: Insets.i56))
                    ]),
                    //profile setting sublayout
                    const ProfileSettingSubLayout()
                  ]),
                  //profile setting button layout
                  const ProfileSettingButtonLayout()
                ]))));
  }
}
