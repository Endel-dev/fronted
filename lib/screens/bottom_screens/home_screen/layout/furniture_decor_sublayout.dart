import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';

import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../provider/bottom_provider/cart_provider.dart';

import 'package:flutter/material.dart';

import '../../../../provider/bottom_provider/home_provider.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_steper_button.dart';
import '../../../../widgets/common_wishlist_button.dart';
class FurnitureDecorSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const FurnitureDecorSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context1, home, child) {
      return Stack(children: [
        //grid layout
        CommonContainerGrid(
          imagePath: data['image'].toString(),
          //cart button layout
          widget: CommonCartButton(
            imagePath: svgAssets.iconCart,
            onTap: () => home.moveToCart(index,
                home.newFurnitureDecor as List<Map<String, dynamic>>, context),
          ).paddingOnly(right: Insets.i9),
        ),
        //wishlist layout
        CommonWishlistButton(
            imagePath: data['isInWishlist']
                ? svgAssets.iconWishlistOne
                : svgAssets.iconWishlistTwo,
            onTap: () => home.moveToWishlist(index,
                home.newFurnitureDecor as List<Map<String, dynamic>>, context)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          VSpace(MediaQuery.of(context).size.height * 0.215),
          Text(language(context, data['title'].toString()),
              overflow: TextOverflow.ellipsis,
              style: appCss.dmPoppinsMedium14
                  .textColor(isThemeColorReturn(context))),
          const VSpace(Sizes.s2),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Text(language(context, data['description'].toString()),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsRegular12
                      .textColor(appColor(context).appTheme.lightText)),
            ),
            const HSpace(Sizes.s2),
            Text(
                '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['finalAmount'].toString()))).toStringAsFixed(1)}',
                overflow: TextOverflow.ellipsis,
                style: appCss.dmPoppinsSemiBold15
                    .textColor(isThemeColorReturn(context)))
          ])
        ]).paddingOnly(left: Insets.i10, right: Insets.i10, bottom: Insets.i10)
      ]);
    });
  }
}
