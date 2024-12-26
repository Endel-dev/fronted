import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';

import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../provider/bottom_provider/cart_provider.dart';

import 'package:flutter/material.dart';

import '../../../../widgets/common_steper_button.dart';
import 'cart_subtext_layout.dart';
import 'cart_widget.dart';
class CartSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const CartSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
      return Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.132,
            width: MediaQuery.of(context).size.width,
            // box decoration
            decoration: CommonWidget().decor(context)),
        Row(children: [
          Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.22,
                  padding: const EdgeInsets.all(Insets.i8),
                  decoration: CartWidget().decor(context),
                  child: Image.asset(data['image'].toString(),
                      fit: BoxFit.scaleDown))
              .paddingAll(Insets.i10),
          //cart list text layout
          CartSubTextLayout(index: index, data: data)
        ]).paddingOnly(bottom: Insets.i15),
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //remove icon click event
          CommonWidget().topAlign(
              context,
              CommonWidget()
                  .svgAssets(context, svgAssets.iconTrash)
                  .inkWell(onTap: () => cart.removeProduct(index))
                  .paddingSymmetric(horizontal: Insets.i10)
                  .paddingOnly(top: Insets.i10)),
          //increment and decrement layout
          CommonWidget().bottomAlign(
              context,
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.045,
                      right: Insets.i5,
                      left: Insets.i5),
                  child: CustomSteeper(
                      qty: data["qty"],
                      onPressedDecrement: () => cart.decrementProduct(index),
                      onPressedIncrement: () => cart.incrementProduct(index))))
        ])
      ]);
    });
  }
}
