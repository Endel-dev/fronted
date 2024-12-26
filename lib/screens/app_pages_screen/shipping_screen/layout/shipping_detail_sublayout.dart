import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/provider/theme_provider/theme_service.dart';
import 'package:piggypaisa/screens/app_pages_screen/shipping_screen/layout/shipping_widget.dart';
import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/shipping_provider.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_filter/common_radio.dart';

class ShippingDetailSubLayout extends StatelessWidget {
  final dynamic data;
  final int? index, selectIndex;
  final GestureTapCallback? onTap;

  const ShippingDetailSubLayout(
      {super.key, this.data, this.index, this.selectIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ShippingProvider, ThemeService>(
        builder: (context, shipping, theme, child) {
      return Container(
              width: MediaQuery.of(context).size.width,
              //decoration
              decoration: ShippingWidget()
                  .shippingDetailsDecor(shipping, index, context),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        //radio button
                        CommonRadio(
                            onTap: onTap,
                            index: index,
                            selectedIndex: selectIndex),
                        const HSpace(Sizes.s13),
                        Text(language(context, data['location']),
                            style: appCss.dmPoppinsSemiBold14
                                .textColor(isThemeColorReturn(context)))
                      ]),
                      //button layout details page edit and delete
                      ShippingWidget()
                          .buttonShippingDetails(context, shipping, index)
                    ]).paddingSymmetric(horizontal: Insets.i15),
                Row(children: [
                  HSpace(MediaQuery.of(context).size.width * 0.13),
                  Text(language(context, data['locationAddress']),
                      style: appCss.dmPoppinsRegular13
                          .textColor(isThemeColorReturn(context)),
                      maxLines: 2)
                ]),
                const VSpace(Sizes.s10),
                Row(children: [
                  HSpace(MediaQuery.of(context).size.width * 0.13),
                  //text layout
                  Text(language(context, appFonts.phone),
                      style: appCss.dmPoppinsRegular13
                          .textColor(isThemeColorReturn(context))),
                  //text layout
                  Text(language(context, data['phoneNumber']),
                      style: appCss.dmPoppinsRegular13
                          .textColor(appColor(context).appTheme.lightText))
                ]).paddingOnly(bottom: Insets.i5)
              ]).paddingSymmetric(vertical: Insets.i10))
          .inkWell(onTap: () => shipping.onSelectShippingMethod(index))
          .paddingOnly(bottom: Insets.i15);
    });
  }
}
