import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/setting_screen/layout/setting_sublayout.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../widgets/common_widgets.dart';
class SettingLayoutOne extends StatelessWidget {
  const SettingLayoutOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: Insets.i20, vertical: Insets.i10),
          //decoration
          decoration: CommonWidget().decorSetting(context),
          //setting list layout with toggle button layout
          child: Column(children: [
            ...appArray.settingList
                .asMap()
                .entries
                .map((e) => SettingSubLayout(
                      index: e.value['id'],
                      data: e.value,
                    ))
                .toList()
          ]));
    });
  }
}
