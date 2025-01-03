import 'package:piggypaisa/Global_values.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../../common/assets/index.dart';
import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_togglebutton.dart';
import '../../../../widgets/common_widgets.dart';
import 'common_listtile.dart';

class CommonNavigationDrawer extends StatelessWidget {
  const CommonNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double drawerWidth = Sizes.s280;
    return Consumer3<ThemeService, DirectionProvider, DashboardProvider>(
        builder: (themeContext, theme, direction, dashboard, child) {
      return Container(
          width: drawerWidth,
          color: appColor(context).appTheme.backGroundColorMain,
          //listview
          child: ListView(
              padding: const EdgeInsets.all(Sizes.s1),
              children: <Widget>[
                const VSpace(Sizes.s40),
                ListTile(
                    leading: Container(
                        height: Sizes.s36,
                        width: Sizes.s36,
                        //image decor
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(imageAssets.profile)),
                    title: Text(
                        "${language(context, appFonts.hello)} ${language(context, username_dispaly.toString())}",
                        style: appCss.dmPoppinsMedium16
                            .textColor(isThemeColorReturn(context))),
                    //svg icon
                    trailing: CommonWidget()
                        .svgAssets(context, svgAssets.iconClose)
                        .inkWell(onTap: () => route.pop(context))),
                ...appArray.drawerList
                    .asMap()
                    .entries
                    .map((e) => Column(children: [
                          //list view in drawer
                          CommonListTile(
                              text: language(context, e.value['title']),
                              //index wise toggle button
                              widget: e.key == 0
                                  ? CommonToggleButton(
                                      onToggle: (val) =>
                                          direction.btnDirection(),
                                      value: direction.getDirection)
                                  : e.key == 1
                                      ? CommonToggleButton(
                                          onToggle: (val) =>
                                              theme.switchTheme(),
                                          value: isTheme(context))
                                      : null,
                              onTap: () => dashboard.onTapList(
                                  e.value, context)),
                          //divider
                          CommonWidget().commonDivider(context),
                        ]))
                    .toList()
              ]));
    });
  }
}
