import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';

import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../provider/bottom_provider/cart_provider.dart';

import 'package:flutter/material.dart';

import '../../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../../provider/bottom_provider/home_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_appbar_button.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_offer_layout.dart';
import '../../../../widgets/common_steper_button.dart';
import '../../../../widgets/common_wishlist_button.dart';
import '../../../../widgets/direction_page.dart';
import 'furniture_list_sublayout.dart';
import 'home_widget.dart';
import 'offerzone_sublayout.dart';

class OfferZoneGridLayout extends StatelessWidget {
  final int? index;
  final dynamic data;

  const OfferZoneGridLayout({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<DirectionProvider>(builder: (context1, direction, child) {
      return Stack(children: [
        //offerzone sub text layout
        OfferZoneSubLayout(
          index: index,
          data: data,
        ),
        //offer design layout
        HomeWidget()
            .align(
                context,
                CustomPaint(
                    painter: RPSCustomPainter(),
                    child: Column(children: [
                      Text(language(context, data['offerDiscount'].toString()),
                              style: appCss.dmPoppinsSemiBold9.textColor(
                                  appColor(context).appTheme.whiteColor))
                          .paddingSymmetric(horizontal: Insets.i5),
                      Text(language(context, data['offer'].toString()),
                          style: appCss.dmPoppinsMedium6.textColor(
                              appColor(context).appTheme.whiteColor)),
                    ])))
            .paddingSymmetric(horizontal: Insets.i20)
      ]);
    });
  }
}
