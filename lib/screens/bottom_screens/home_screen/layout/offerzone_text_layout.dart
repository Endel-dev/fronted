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
import '../../../../widgets/common_cart/common_cart.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_steper_button.dart';
import '../../../../widgets/common_wishlist_button.dart';
import '../../../../widgets/direction_page.dart';
import 'furniture_list_sublayout.dart';
import 'home_widget.dart';

class OfferZoneTextLayout extends StatelessWidget {
  final int? index;
  final dynamic data;

  const OfferZoneTextLayout({super.key, this.data, this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //text layout
          Text(language(context, data['title'].toString()),
              overflow: TextOverflow.ellipsis,
              style: appCss.dmPoppinsMedium14
                  .textColor(isThemeColorReturn(context))), //text layout
          Text(language(context, data['description'].toString()),
              overflow: TextOverflow.ellipsis,
              style: appCss.dmPoppinsRegular12
                  .textColor(appColor(context).appTheme.lightText)),
          const VSpace(Sizes.s5),
          //rating design layout
          CommonWidget().ratingBar()
        ]).paddingOnly(top: Insets.i10),
        const VSpace(Sizes.s10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            //text layout
            Text(
                language(context,
                    '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['finalAmount'].toString()))).toStringAsFixed(1)}'),
                overflow: TextOverflow.ellipsis,
                style: appCss.dmPoppinsSemiBold15
                    .textColor(isThemeColorReturn(context))),
            const HSpace(Sizes.s5),
            data['amount'] != null //text layout
                ? Text(
                    language(context,
                        '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['amount'].toString()))).toStringAsFixed(1)}'),
                    overflow: TextOverflow.ellipsis,
                    style: appCss.dmPoppinsRegular12
                        .textColor(appColor(context).appTheme.lightText)
                        .textDecoration(TextDecoration.lineThrough,
                            color: appColor(context).appTheme.lightText,
                            thickness: Sizes.s2))
                : const Text("")
          ]),
          //cart button layout and click event
          CommonCart(
            imagePath: svgAssets.iconCart,
            onTap: () => home.moveToCart(index!,
                home.newOfferZone as List<Map<String, dynamic>>, context),
          ).paddingOnly(right: Insets.i10, left: Insets.i10)
        ])
        //cart layout
      ]);
    });
  }
}
