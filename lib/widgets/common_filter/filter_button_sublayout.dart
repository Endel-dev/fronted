import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../common/theme/scale.dart';
import '../../config.dart';
import 'package:flutter/material.dart';

import '../../provider/app_pages_provider/filter_provider.dart';
import '../../provider/theme_provider/theme_service.dart';
import '../../routes/index.dart';
import '../../utils/common_function.dart';
import '../common_button.dart';

class FilterButtonSubLayout extends StatelessWidget {
  const FilterButtonSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService,FilterProvider>(
      builder: (context1,theme,filter,child) {
        //filter bottom button layout
        return Container(
            height: Sizes.s73,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(
                  width: Sizes.s1,
                  color: appColor(context).appTheme.shadowWhiteColor,
                ),
                color: appColor(context).appTheme.colorContainer,
                boxShadow:  [
                  BoxShadow(
                      color:  appColor(context).appTheme.shadowColorTwo,
                      spreadRadius: 2,
                      blurRadius: 8)
                ]),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ButtonCommon(
                  title: language(context, appFonts.reset),
                  width: Sizes.s157,
                  height: Sizes.s48,
                  color: appColor(context).appTheme.searchBackground,
                  style: appCss.dmPoppinsRegular16
                      .textColor(appColor(context).appTheme.lightText),
                  radius: AppRadius.r10,
                  onTap: () => filter.clearFilter(context)),
              ButtonCommon(
                  title: language(context, appFonts.apply),
                  width: Sizes.s157,
                  height: Sizes.s48,
                  color: isTheme(context)?appColor(context).appTheme.btnPrimaryColor:appColor(context).appTheme.primaryColor,
                  style: appCss.dmPoppinsRegular16
                      .textColor(isTheme(context)?appColor(context).appTheme.primaryColor:appColor(context).appTheme.whiteColor),
                  radius: AppRadius.r10,
                  onTap: () => route.pop(context))
            ]).paddingAll(Insets.i10));
      }
    );
  }
}
