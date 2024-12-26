import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:flutter/material.dart';

import '../../../provider/bottom_provider/cart_provider.dart';
import '../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/common_statefulwapper.dart';
import '../../../widgets/direction_page.dart';
import 'layout/cart_botton_layout.dart';
import 'layout/cart_sublayout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartProvider, DashboardProvider>(
        builder: (context1, cart, dashboard, child) {
          //back press on device
      return
        //page load
       StatefulWrapper(
            onInit: () => Future.delayed(const Duration(microseconds: 1))
                .then((_) => cart.onReady(context)),
            //direction layout
            child: DirectionLayout(
                dChild: Scaffold(
                    backgroundColor:
                        appColor(context).appTheme.backGroundColorMain,
                    body: SafeArea(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(children: [
                            //appbar layout and back press
                            CommonAppBar(
                                appName: language(context, appFonts.cart),
                                isIcon: true,
                                onPressed: () => dashboard.moveTab(context, 0,
                                    isBack: true)).paddingOnly(
                                top: Insets.i8,
                                left: Insets.i20,
                                right: Insets.i20),
                            //cart list layout
                            Column(children: [
                              ...cart.cartList
                                  .asMap()
                                  .entries
                                  .map((e) => CartSubLayout(
                                        index: e.key,
                                        data: e.value,
                                      ))
                                  .toList()
                            ]).paddingSymmetric(
                                horizontal: Insets.i20, vertical: Insets.i10)
                          ]))),
                          //cart button layout
                          const CartBottomLayout()
                        ])))));

    });
  }
}
