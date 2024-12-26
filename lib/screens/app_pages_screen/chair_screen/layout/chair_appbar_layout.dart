import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../common/assets/index.dart';
import '../../../../common/theme/scale.dart';
import '../../../../provider/bottom_provider/category_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../../widgets/common_appbar_button.dart';
import '../../../../widgets/common_widgets.dart';

class ChairAppbarLayout extends StatelessWidget {
  const ChairAppbarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CategoryProvider, ThemeService>(
        builder: (context1, category, theme, child) {
      return Column(children: [
        Stack(children: [
          //appbar
          CommonAppBar(
              isIcon: true,
              appName: language(context, appFonts.chairs),
              onPressed: () => route.pop(context)),
          //alignment set
          CommonWidget().topAlign(
              context,
              //notification button on appbar
              CommonAppbarButton(
                  imagePath: isTheme(context)
                      ? svgAssets.iconTopNotificationWhite
                      : svgAssets.iconTopNotification,
                  onPressed: () =>
                      route.pushNamed(context, routeName.notification)))
        ])
            .paddingSymmetric(horizontal: Insets.i20)
            .paddingOnly(top: Insets.i10),
        //Filter layout
        CommonWidget()
            .filterLayout(category.searchCtrl, context)
            .paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i25)
      ]);
    });
  }
}
