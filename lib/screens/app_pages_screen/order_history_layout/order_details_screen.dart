import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/config.dart';
import 'package:piggypaisa/plugin_list.dart';

import '../../../provider/app_pages_provider/details_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_statefulwapper.dart';
import '../../../widgets/direction_page.dart';
import 'layout/order_details_sublayout_one.dart';
import 'layout/order_details_sublayout_three.dart';
import 'layout/order_details_sublayout_two.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context, details, child) {
      return DirectionLayout(
          dChild: StatefulWrapper(
              onInit: () => Future.delayed(const Duration(milliseconds: 50))
                  .then((_) => details.onReady(context)),
              child: Scaffold(
                  backgroundColor:
                      appColor(context).appTheme.backGroundColorMain,
                  body: SafeArea(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        SingleChildScrollView(
                            child: Column(children: [
                          //order details appbar layout
                          CommonAppBar(
                              appName: language(context, appFonts.orderDetail),
                              isIcon: true,
                              onPressed: () => route
                                  .pop(context)).paddingOnly(top: Insets.i10),
                          const VSpace(Sizes.s20),
                          //order details top container data
                          const OrderDetailsSubLayoutOne(),
                          const VSpace(Sizes.s15),
                          //order details center container data
                          const OrderDetailsSubLayoutTwo(),
                          const VSpace(Sizes.s15),
                          //order details bottom container data
                          const OrderDetailsSubLayoutThree()
                        ])),
                        //button layout
                        ButtonCommon(
                            title: language(context, appFonts.downloadInvoice),
                            color: isThemeButtonColorReturn(context),
                            style: appCss.dmPoppinsRegular16
                                .textColor(isThemeColorReturnDark(context)),
                            radius: AppRadius.r10,
                            onTap: () =>
                                details.onOrderDetails(context, details.isBack))
                      ]).paddingOnly(
                          left: Insets.i20,
                          right: Insets.i20,
                          bottom: Insets.i10)))));
    });
  }
}
