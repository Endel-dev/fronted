import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/payment_screen/layout/payment_widget.dart';
import '../../../../config.dart';
import '../../../../config.dart';
import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../provider/app_pages_provider/payment_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_button.dart';
import '../../../../widgets/common_statefulwapper.dart';
import '../../../../widgets/common_widgets.dart';
class PaymentButtonLayout extends StatelessWidget {
  const PaymentButtonLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PaymentProvider, ThemeService>(
        builder: (context1, payment, theme, child) {
          //load page
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(microseconds: 1))
              .then((_) => payment.onReady(context)),
          child: Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: Insets.i10),
                //decoration
                decoration: PaymentWidget().paymentDecor(context),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(language(context, appFonts.totalPrice),
                                style: appCss.dmPoppinsRegular12.textColor(
                                    appColor(context).appTheme.lightText)),
                            Text(
                                language(context,
                                    '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.totalAmount))).toStringAsFixed(1)}'),
                                overflow: TextOverflow.ellipsis,
                                style: appCss.dmPoppinsSemiBold20
                                    .textColor(isThemeColorReturn(context)))
                          ]).paddingSymmetric(horizontal: Insets.i20),
                      ButtonCommon(
                              title: language(context, appFonts.payNow),
                              width: Sizes.s157,
                              height: Sizes.s48,
                              color: isThemeButtonColorReturn(context),
                              style: appCss.dmPoppinsRegular16
                                  .textColor(isThemeColorReturnDark(context)),
                              radius: AppRadius.r10,
                              onTap: () =>
                                  payment.onBtnPayNow(context, payment))
                          .paddingSymmetric(horizontal: Insets.i10)
                    ]))
          ]));
    });
  }
}
