import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:flutter/material.dart';

import '../../../plugin_list.dart';
import '../../../provider/app_pages_provider/currency_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_filter/common_radio.dart';
import '../../../widgets/common_widgets.dart';
class CurrencySubLayout extends StatelessWidget {
  final int index;
  final dynamic data;
  const CurrencySubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(builder: (context1, currency, child) {
      return Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Container(
                height: Sizes.s40,
                width: Sizes.s40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r6),
                    color: appColor(context).appTheme.searchBackground),
                //svg image
                child: CommonWidget()
                    .svgAssets(context, data['icon'].toString())
                    .paddingAll(Insets.i12)),
            Text(language(context, data['title'].toString()),
                    style: appCss.dmPoppinsMedium14
                        .textColor(isThemeColorReturn(context)))
                .paddingSymmetric(horizontal: Insets.i20)
          ]),
          //radio button
          CommonRadio(
              onTap: () =>
                  currency.onSelectCurrencyMethod(index, context, data),
              index: index,
              selectedIndex: currency.selectIndex)
        ]),
        const VSpace(Sizes.s10),
        //divider
        if (index != currency.currencyListData.length - 1) CommonWidget().commonDivider(context),
      ]).paddingOnly(bottom: Insets.i15);
    });
  }
}
