import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/config.dart';
import 'package:piggypaisa/screens/app_pages_screen/payment_screen/layout/payment_widget.dart';
import '../../../../common/theme/scale.dart';
import '../../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/payment_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_filter/common_radio.dart';

class PaymentMethodLayout extends StatelessWidget {
  final dynamic data;
  final int? index, selectIndex;
  final GestureTapCallback? onTap;

  const PaymentMethodLayout(
      {super.key, this.data, this.index, this.selectIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PaymentProvider, ThemeService>(
        builder: (context1, payment, theme, child) {
      //on tap event
      return GestureDetector(
        onTap: () => payment.onSelectPaymentMethod(data['id']),
        child: Container(
            height: Sizes.s67,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: Insets.i15),
            //decoration
            decoration: PaymentWidget().decoPayment(context),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SvgPicture.asset(
                      data['icon'],
                      fit: BoxFit.scaleDown,
                    ).paddingOnly(left: Insets.i10, right: Insets.i15),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(language(context, data['card']),
                              style: appCss.dmPoppinsRegular12
                                  .textColor(isThemeColorReturn(context))),
                          Text(language(context, data['date']),
                              style: appCss.dmPoppinsRegular12.textColor(
                                  appColor(context).appTheme.lightText)),
                        ]).paddingOnly(top: Insets.i15),
                  ]),
                  //radio button
                  CommonRadio(
                    onTap: onTap,
                    index: index,
                    selectedIndex: selectIndex,
                  ).paddingSymmetric(horizontal: Insets.i20)
                ])),
      );
    });
  }
}
