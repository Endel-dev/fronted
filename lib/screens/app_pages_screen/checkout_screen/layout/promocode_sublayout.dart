import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/provider/bottom_provider/cart_provider.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import 'checkout_widget.dart';

class PromoCodeSubLayout extends StatelessWidget {
  const PromoCodeSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context1, cart, child) {
      return Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.88,
            height: Sizes.s52,
            //decoration
            decoration: CheckOutWidget().promoDecor(context),
            child: DottedBorder(
                color: appColor(context).appTheme.lightText,
                strokeWidth: Sizes.s1,
                borderType: BorderType.RRect,
                radius: const Radius.circular(AppRadius.r10),
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //text layout
                      Text(
                          language(context, cart.data ?? appFonts.promoCodeOne),
                          style: appCss.dmPoppinsMedium14
                              .textColor(isThemeColorReturn(context))),
                      Row(children: [
                        //divider
                        CheckOutWidget().divider(context, isTheme(context)),
                        const HSpace(Sizes.s15),
                        //selected promo code apply on apply click event
                        Text(language(context, appFonts.apply),
                                style: appCss.dmPoppinsMedium14
                                    .textColor(isThemeColorReturn(context)))
                            .inkWell(
                                onTap: () => cart.clickPromoCode(context, cart))
                      ])
                    ]).paddingSymmetric(horizontal: Insets.i15))))
      ]);
    });
  }
}
