import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/provider/app_pages_provider/shipping_provider.dart';
import 'package:piggypaisa/widgets/common_statefulwapper.dart';
import '../../../config.dart';
import 'package:flutter/material.dart';

import '../../../provider/theme_provider/theme_service.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/direction_page.dart';
import 'layout/shipping_detail_sublayout.dart';

class ShippingDetailsLayout extends StatelessWidget {
  const ShippingDetailsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ShippingProvider, ThemeService>(
        builder: (context1, shipping, theme, child) {
          //direction layout
      return DirectionLayout(
          dChild: StatefulWrapper(
            //load event
              onInit: () => Future.delayed(const Duration(microseconds: 1))
                  .then((_) => shipping.onReady(context)),
              child: Scaffold(
                  backgroundColor:
                      appColor(context).appTheme.backGroundColorMain,
                  body: SafeArea(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        SingleChildScrollView(
                            child: Column(children: [
                          //shipping details appbar
                          CommonAppBar(
                                  appName: language(
                                      context, appFonts.shippingDetails),
                                  isIcon: true,
                                  onPressed: () => route.pop(context))
                              .paddingSymmetric(vertical: Insets.i10),
                          //shipping method layout
                          ...shipping.addressList
                              .asMap()
                              .entries
                              .map((e) => ShippingDetailSubLayout(
                                  index: e.key,
                                  data: e.value,
                                  selectIndex: shipping.selectIndex,
                                  onTap: () =>
                                      shipping.onSelectShippingMethod(e.key)))
                              .toList(),
                          const VSpace(Sizes.s15),
                          //new Address add
                          ButtonCommon(
                              title: language(context, appFonts.addAddress),
                              color:
                                  appColor(context).appTheme.searchBackground,
                              style: appCss.dmPoppinsRegular16
                                  .textColor(isThemeColorReturn(context)),
                              radius: AppRadius.r10,
                              onTap: () => route.pushNamed(
                                  context, routeName.addNewAddress))
                        ])),
                        //apply for payment
                        ButtonCommon(
                                title: language(context, appFonts.apply),
                                color: isThemeButtonColorReturn(context),
                                style: appCss.dmPoppinsRegular16
                                    .textColor(isThemeColorReturnDark(context)),
                                radius: AppRadius.r10,
                                onTap: () =>
                                    shipping.onBtnClick(shipping, context))
                            .paddingOnly(bottom: Insets.i10)
                      ]).paddingSymmetric(horizontal: Insets.i20)))));
    });
  }
}
