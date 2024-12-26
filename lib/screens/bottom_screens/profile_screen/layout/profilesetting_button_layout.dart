import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/screens/bottom_screens/profile_screen/layout/profile_widget.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_button.dart';

class ProfileSettingButtonLayout extends StatelessWidget {
  const ProfileSettingButtonLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Stack(children: [
        Container(
            height: Sizes.s73,
            width: MediaQuery.of(context).size.width,
            //button decoration
            decoration: ProfileWidget().buttonBottomDecor(context),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonCommon(
                      title: language(context, appFonts.cancle),
                      width: Sizes.s157,
                      height: Sizes.s48,
                      color: isTheme(context)
                          ? appColor(context).appTheme.transparentColor
                          : appColor(context).appTheme.searchBackground,
                      style: appCss.dmPoppinsRegular16
                          .textColor(appColor(context).appTheme.lightText),
                      radius: AppRadius.r10,
                      onTap: () => route.pop(context)),
                  ButtonCommon(
                      title: language(context, appFonts.save),
                      width: Sizes.s157,
                      height: Sizes.s48,
                      color: isThemeButtonColorReturn(context),
                      style: appCss.dmPoppinsRegular16.textColor(
                          isTheme(context)
                              ? appColor(context).appTheme.primaryColor
                              : appColor(context).appTheme.whiteColor),
                      radius: AppRadius.r10,
                      onTap: () => route.pop(context))
                ]).paddingAll(Insets.i10))
      ]);
    });
  }
}
