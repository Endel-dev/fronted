import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/widgets/direction_page.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:flutter/material.dart';

import '../../../provider/theme_provider/theme_service.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import 'layout/setting_layout.dart';
class SettingLayout extends StatelessWidget {
  const SettingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              body: SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          //appbar for setting page
                          CommonAppBar(
                                  appName: language(context, appFonts.setting),
                                  isIcon: true,
                                  onPressed: () => route.pop(context))
                              .paddingSymmetric(
                                  horizontal: Insets.i20, vertical: Insets.i10),
                          //setting list layout
                          const SettingLayoutOne(),
                        ]))
                  ]))));
    });
  }
}
