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
import 'offerzone_grid_layout.dart';

class OfferZoneLayout extends StatelessWidget {
  const OfferZoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      return Stack(children: [
        Container(
            color: appColor(context).appTheme.containerZone,
            child: Column(children: [
              //offer zone text layout
              HomeWidget().listNameCommon(
                  context,language(context, appFonts.offer))
                  .paddingOnly(
                      top: Insets.i20,
                      left: Insets.i20,
                      right: Insets.i20,
                      bottom: Insets.i15),
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: appColor(context).appTheme.containerZone,
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: home.newOfferZone.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 0.38,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              maxCrossAxisExtent: 160),
                      itemBuilder: (context, index) {
                        //offerZone layout and click event product list
                        return OfferZoneGridLayout(
                          data: home.newOfferZone[index],
                          index: index,
                        ).inkWell(
                            onTap: () =>
                                route.pushNamed(context, routeName.chairData));
                      })).paddingOnly(left: Insets.i20, right: Insets.i15),
              const VSpace(Sizes.s20),
            ]))
      ]);
    });
  }
}
