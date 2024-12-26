import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/config.dart';
import '../../../common/theme/scale.dart';
import '../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../provider/bottom_provider/category_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/direction_page.dart';
import 'layout/order_history_sublayout.dart';

class OrderHistoryLayout extends StatelessWidget {
  const OrderHistoryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, category, child) {
      //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                //order history appbar layout and filter layout
                CommonAppBar(
                        isIcon: true,
                        appName: language(context, appFonts.orderHistory),
                        onPressed: () => route.pop(context))
                    .paddingOnly(top: Insets.i10),
                //search widget
                CommonWidget()
                    .filterLayout(category.searchCtrl, context)
                    .paddingOnly(top: Insets.i20),
                const VSpace(Sizes.s20),
                //order history list layout
                ...appArray.orderHistory
                    .asMap()
                    .entries
                    .map((e) =>
                        OrderHistorySubLayout(index: e.key, data: e.value))
                    .toList()
              ]).paddingSymmetric(horizontal: Insets.i20)))));
    });
  }
}
