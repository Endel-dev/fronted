import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../config.dart';
import '../../../provider/app_pages_provider/currency_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/common_statefulwapper.dart';
import '../../../widgets/direction_page.dart';
import 'currency_sublayout.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(builder: (context, currency, child) {
      return StatefulWrapper(
          //load event
          onInit: () => Future.delayed(const Duration(milliseconds: 50))
              .then((_) => currency.onReady()),
          //direction
          child: DirectionLayout(
              dChild: Scaffold(
                  backgroundColor:
                      appColor(context).appTheme.backGroundColorMain,
                  body: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    Column(children: [
                      //appbar on currency page
                      CommonAppBar(
                              appName: language(context, appFonts.currency),
                              isIcon: true,
                              onPressed: () => route.pop(context))
                          .paddingSymmetric(
                              vertical: Insets.i10, horizontal: Insets.i20),
                      //currency list layout and list click event
                      Column(
                              children: currency.currencyListData
                                  .asMap()
                                  .entries
                                  .map((e) {
                        return CurrencySubLayout(index: e.key, data: e.value)
                            .inkWell(
                          onTap: () => currency.onSelectCurrencyMethod(
                              e.key, context, e.value),
                        );
                      }).toList())
                          .paddingSymmetric(horizontal: Insets.i20)
                    ])
                  ]))))));
    });
  }
}
