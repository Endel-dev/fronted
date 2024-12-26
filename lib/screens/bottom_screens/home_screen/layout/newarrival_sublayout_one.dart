import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/provider/bottom_provider/home_provider.dart';
import '../../../../common/assets/index.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../plugin_list.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_wishlist_button.dart';
import 'newarrival_sublayout.dart';

class NewArrivalSubLayoutOne extends StatelessWidget {
  final int index;
  final dynamic data;

  const NewArrivalSubLayoutOne({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context1, home, child) {
      return Stack(children: [
        //image display in gridview //add to cart button
        CommonContainerGrid(
          imagePath: data['image'].toString(),
          widget: CommonCartButton(
            imagePath: svgAssets.iconCart,
            onTap: () => home.moveToCart(index,
                home.newArrivalList as List<Map<String, dynamic>>, context),
          ).paddingOnly(right: Insets.i9),
        ),
        //wishlist button
        CommonWishlistButton(
          imagePath: data['isInWishlist'] == true
              ? svgAssets.iconWishlistOne
              : svgAssets.iconWishlistTwo,
          onTap: () => home.moveToWishlist(index,
              home.newArrivalList as List<Map<String, dynamic>>, context),
        ),
        //subdata display and product click event to more product page
        NewArrivalSubLayout(
          index: index,
          data: data,
        ),
      ]).inkWell(onTap: () => route.pushNamed(context, routeName.chairData));
    });
  }
}
