import 'package:piggypaisa/common/theme/scale.dart';
import 'package:piggypaisa/config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../provider/bottom_provider/cart_provider.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../bottom_screens/cart_screen/layout/cart_sublayout.dart';
import 'checkout_widget.dart';

class CartListData extends StatelessWidget {
  const CartListData({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context1, cart, child) {
      return Column(
        children: [
          const VSpace(Sizes.s25),
          //divider on checkout page
           CommonWidget().commonDivider(context),
          const VSpace(Sizes.s20),
          //cart list on check out page
          ...cart.cartList
              .asMap()
              .entries
              .map((e) => CartSubLayout(
                    index: e.key,
                    data: e.value,
                  ))
              .toList(),
          const VSpace(Sizes.s5),
          //divider on checkout page
          CommonWidget().commonDivider(context),
          const VSpace(Sizes.s20),
          //choose shipping text layout
          CheckOutWidget().mainAllText(context,
              mainText: language(context, appFonts.chooseShipping)),
          const VSpace(Sizes.s15),
        ],
      );
    });
  }
}
