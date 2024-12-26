import 'package:piggypaisa/screens/bottom_screens/home_screen/layout/trendfurniture_sublayout_list.dart';

import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';

import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../provider/bottom_provider/cart_provider.dart';

import 'package:flutter/material.dart';

import '../../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../../provider/bottom_provider/home_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_appbar_button.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_steper_button.dart';
import '../../../../widgets/common_wishlist_button.dart';
import '../../../../widgets/direction_page.dart';
import 'furniture_list_sublayout.dart';
import 'home_widget.dart';
class TrendFurnitureLayout extends StatelessWidget {
  const TrendFurnitureLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      return Stack(children: [
        Column(children: [
          const VSpace(Sizes.s25),
          //trendFurniture name
          HomeWidget().listNameCommon(
              context,language(context, appFonts.trendFurniture)),
          const VSpace(Sizes.s15),
          //trendFurniture list and click event
          ...home.newTrendFurniture
              .asMap()
              .entries
              .map((e) => TrendFurnitureList(
                    index: e.key,
                    data: e.value,
                  ).inkWell(
                      onTap: () =>
                          route.pushNamed(context, routeName.chairData)))
              .toList()
        ])
      ]);
    });
  }
}
