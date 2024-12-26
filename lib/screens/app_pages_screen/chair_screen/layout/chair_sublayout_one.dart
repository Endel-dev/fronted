import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/provider/bottom_provider/category_provider.dart';
import '../../../../common/assets/index.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../routes/index.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import 'chair_sublayout.dart';

class ChairSubLayoutOne extends StatelessWidget {
  final int index;
  final dynamic data;

  const ChairSubLayoutOne({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context1, category, child) {
      return GestureDetector(
          onTap: () => route.pushNamed(context, routeName.detailsScreen),
          child: Stack(children: [
            //grid view layout
            CommonContainerGrid(
                imagePath: data['image'].toString(),
                //cart button layout and click event
                widget: CommonCartButton(
                  imagePath: svgAssets.iconCart,
                  onTap: () => category.moveToCart(
                      index,
                      category.chairList as List<Map<String, dynamic>>,
                      context),
                ).paddingOnly(right: Insets.i9)),
            //chair page sub layout
            ChairSubLayout(index: index, data: data)
          ]));
    });
  }
}
