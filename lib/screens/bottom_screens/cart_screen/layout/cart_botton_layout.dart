import 'package:piggypaisa/plugin_list.dart';
import '../../../../config.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_statefulwapper.dart';


import 'package:piggypaisa/plugin_list.dart';

import '../../../../provider/bottom_provider/cart_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_button.dart';
import 'cart_widget.dart';

class CartBottomLayout extends StatelessWidget {
  const CartBottomLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, CartProvider>(
        builder: (context1, theme, cart, child) {
      return Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            //button decor
            decoration: CartWidget().buttonDecor(context),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //text layout
                      Text(language(context, appFonts.totalPrice),
                          style: appCss.dmPoppinsRegular12
                              .textColor(appColor(context).appTheme.lightText)),
                      //text layout
                      Text(
                          language(context,
                              '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.totalAmount))).toStringAsFixed(1)}'),
                          overflow: TextOverflow.ellipsis,
                          style: appCss.dmPoppinsSemiBold20
                              .textColor(isThemeColorReturn(context)))
                    ],
                  ).paddingSymmetric(
                      horizontal: Insets.i20, vertical: Insets.i10),
                  //check out click event
                  ButtonCommon(
                          title: language(context, appFonts.checkOut),
                          width: Sizes.s157,
                          height: Sizes.s48,
                          color: isThemeButtonColorReturn(context),
                          style: appCss.dmPoppinsRegular16
                              .textColor(isThemeColorReturnDark(context)),
                          radius: AppRadius.r10,
                          onTap: () => cart.onBtnClick(context, cart.isBack))
                      .paddingSymmetric(horizontal: Insets.i15)
                ]))
      ]);
    });
  }
}
