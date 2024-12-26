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
import 'offerzone_text_layout.dart';

class OfferZoneSubLayout extends StatelessWidget {
  final int? index;
  final dynamic data;

  const OfferZoneSubLayout({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      return Stack(children: [
        Container(
            //offer decoration layout
            decoration: HomeWidget().decorOfferZone(context),
            child: Row(children: [
              Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Insets.i18, vertical: Insets.i14),
                      height: Sizes.s88,
                      width: Sizes.s88,
                      //offer decoration layout
                      decoration: HomeWidget().offerZoneDecor(context),
                      child: Image.asset(data['image'].toString(),
                          fit: BoxFit.scaleDown))
                  .paddingAll(Insets.i10),
              //offer text layout
              Expanded(
                child: OfferZoneTextLayout(
                  index: index,
                  data: data,
                ),
              )
            ]))
      ]);
    });
  }
}
