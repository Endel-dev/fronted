import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/screens/bottom_screens/profile_screen/layout/profile_widget.dart';
import '../../../../common/assets/index.dart';
import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/search_text_filed_common.dart';

class ProfileSettingSubLayout extends StatelessWidget {
  const ProfileSettingSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Column(children: [
        //text layout
        ProfileWidget().textLayout(language(context, appFonts.name), context),
        const VSpace(Sizes.s6),
        //text filed
        SearchTextFieldCommon(
          hintStyle: appCss.dmPoppinsRegular13
              .textColor(appColor(context).appTheme.lightText),
          prefixIcon: ProfileWidget().svgImage(context, svgAssets.iconProfile),
          hintText: language(context, appFonts.profileName),
          keyboardType: TextInputType.text,
          //controller: ,
          // focusNode: ,
          //validator: ,
        ),
        const VSpace(Sizes.s15),
        //text layout
        ProfileWidget().textLayout(language(context, appFonts.email), context),
        const VSpace(Sizes.s6),
        //text filed
        SearchTextFieldCommon(
          hintStyle: appCss.dmPoppinsRegular13
              .textColor(appColor(context).appTheme.lightText),
          prefixIcon: ProfileWidget().svgImage(context, svgAssets.iconEmail),
          hintText: language(context, appFonts.hintEmailProfile),
          keyboardType: TextInputType.text,
          //controller: ,
          // focusNode: ,
          //validator: ,
        ),
        const VSpace(Sizes.s15),
        //text layout
        ProfileWidget().textLayout(
            language(context, appFonts.phoneNumberProfile), context),
        const VSpace(Sizes.s6),
        //text filed
        SearchTextFieldCommon(
          hintStyle: appCss.dmPoppinsRegular13
              .textColor(appColor(context).appTheme.lightText),
          prefixIcon: ProfileWidget().svgImage(context, svgAssets.iconPhone),
          hintText: language(context, appFonts.hintProfilePhoneNumber),
          keyboardType: TextInputType.text,
          //controller: ,
          // focusNode: ,
          //validator: ,
        )
      ]).paddingSymmetric(horizontal: Insets.i20);
    });
  }
}
