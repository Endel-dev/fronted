import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../config.dart';
import 'package:flutter/material.dart';

import '../../../provider/app_pages_provider/payment_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/direction_page.dart';
import 'layout/payment_button_layout.dart';
import 'layout/payment_method_layout.dart';
import 'layout/payment_wallet.dart';
import 'layout/payment_widget.dart';

class PaymentLayout extends StatelessWidget {
  const PaymentLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(builder: (context1, payment, child) {
      //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              body: SafeArea(
                  child: Stack(children: [
                SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      //appbar payment page
                      CommonAppBar(
                          appName: language(context, appFonts.paymentMethod),
                          isIcon: true,
                          onPressed: () =>
                              route.pop(context)).paddingOnly(
                          top: Insets.i10, bottom: Insets.i30),
                      Text(language(context, appFonts.yourCard),
                          style: appCss.dmPoppinsSemiBold16
                              .textColor(isThemeColorReturn(context))),
                      const VSpace(Sizes.s15),
                      //payment screen top list layout and click event
                      ...appArray.paymentMethod
                          .sublist(0, 2)
                          .asMap()
                          .entries
                          .map((e) => PaymentMethodLayout(
                              index: e.value['id'],
                              data: e.value,
                              selectIndex: payment.selectIndex,
                              onTap: () {
                                payment.onSelectPaymentMethod(e.value['id']);
                              }))
                          .toList(),
                      //add new card text link layout
                      PaymentWidget().textLinkLayout(context).inkWell(
                          onTap: () => // add new card
                              route.pushNamed(context, routeName.addCard)),
                      const VSpace(Sizes.s20),
                      //divider
                          CommonWidget().commonDivider(context),
                      const VSpace(Sizes.s20),
                      Text(language(context, appFonts.wallet),
                          style: appCss.dmPoppinsSemiBold16
                              .textColor(isThemeColorReturn(context))),
                      const VSpace(Sizes.s10),
                      // payment wallet design
                      const PaymentWallet()
                    ])).paddingSymmetric(horizontal: Insets.i20),
                //payment bottom button layout
                const Align(
                    alignment: Alignment.bottomCenter,
                    child: PaymentButtonLayout()),
              ]))));
    });
  }
}
