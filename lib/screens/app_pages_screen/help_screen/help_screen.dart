import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:flutter/material.dart';

import '../../../provider/app_pages_provider/help_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/direction_page.dart';
import 'layout/help_sublayout.dart';
class HelpLayout extends StatelessWidget {
  const HelpLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HelpProvider>(builder: (context, help, child) {
      //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(children: [
                  //appbar layout
                  CommonAppBar(
                          appName: language(context, appFonts.helpCenter),
                          isIcon: true,
                          onPressed: () => route.pop(context))
                      .paddingOnly(top: Insets.i10, bottom: Insets.i20),
                  //image layout
                  SizedBox(
                    child: Image.asset(
                      imageAssets.imageHelp,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const VSpace(Sizes.s20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(language(context, appFonts.helpCenter),
                            style: appCss.dmPoppinsMedium14
                                .textColor(isThemeColorReturn(context))),
                        const VSpace(Sizes.s8),
                        //help text layout
                        Text(language(context, appFonts.helpDescription),
                            style: appCss.dmPoppinsRegular12.textColor(
                                appColor(context).appTheme.lightText)),
                        const VSpace(Sizes.s8),
                        Text(language(context, appFonts.query),
                            style: appCss.dmPoppinsRegular14
                                .textColor(isThemeColorReturn(context))),
                        const VSpace(Sizes.s8),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: appArray.helpList.length,
                            itemBuilder: (BuildContext context, int index) {
                              help.selectedIndex = index;
                              final currentItem = appArray
                                  .helpList[help.selectedIndex]['sublist'];
                              //header layout and sub layout
                              return HelpSubLayout(
                                data: appArray.helpList[index],
                                subData: currentItem,
                              );
                            }),
                      ])
                ]).paddingSymmetric(horizontal: Insets.i20),
              ))));
    });
  }
}
