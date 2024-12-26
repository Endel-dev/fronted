import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/screens/bottom_screens/profile_screen/layout/profile_sublayout.dart';
import 'package:piggypaisa/widgets/common_appbar.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/bottom_provider/profile_provider.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';

class ProfileAppbarLayout extends StatelessWidget {
  const ProfileAppbarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context1, profile, child) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: Sizes.s114,
                width: MediaQuery.of(context).size.width,
                color: appColor(context).appTheme.searchBackground,
                child: Column(children: [
                  //appbar
                  CommonAppBar(
                          appName: language(context, appFonts.profile),
                          isIcon: true,
                          onPressed: () =>
                              profile.onBackPress(context, profile.isBack))
                      .paddingSymmetric(horizontal: Insets.i20)
                      .paddingOnly(top: Insets.i10)
                ])),
            const VSpace(Sizes.s35),
            //profile list of layout
            const ProfileSubLayout()
          ]);
    });
  }
}
