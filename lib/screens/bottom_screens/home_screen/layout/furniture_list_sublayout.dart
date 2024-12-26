import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';

import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../provider/bottom_provider/cart_provider.dart';

import 'package:flutter/material.dart';

import '../../../../provider/bottom_provider/home_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_steper_button.dart';
import '../../../../widgets/common_wishlist_button.dart';
import 'furniture_list_sublayout.dart';
import 'home_widget.dart';

class FurnitureListSubLayout extends StatelessWidget {
  final dynamic data;
  final int? index;

  const FurnitureListSubLayout({super.key, this.data, this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer3<HomeProvider, ThemeService, DirectionProvider>(
        builder: (context, home, theme, direction, child) {
      return Row(children: [
        //list on click event
        Container(
                //decoration layout
                decoration: HomeWidget()
                    .furnitureListDecor(context, home.selectIndex, index),
                child: Center(
                    child: Row(children: [
                  if (data['image'] != null)
                    //icon layout in furniture list
                    isDirectionRTL(context) || isAr(context)
                        ? HomeWidget()
                            .iconFurniture(
                                context, data, home.selectIndex, index)
                            .paddingOnly(
                                right: index == 0 ? Insets.i10 : Insets.i0)
                        : HomeWidget()
                            .iconFurniture(
                                context, data, home.selectIndex, index)
                            .paddingOnly(
                                left: index == 0 ? Insets.i10 : Insets.i0),
                  Text(language(context, data['title'].toString()),
                          style: appCss.dmPoppinsRegular13.textColor(theme
                                  .isDarkMode
                              ? home.selectIndex == index
                                  ? appColor(context).appTheme.primaryColor
                                  : appColor(context)
                                      .appTheme
                                      .txtTransparentColor
                              : home.selectIndex == index
                                  ? appColor(context).appTheme.whiteColor
                                  : appColor(context).appTheme.primaryColor))
                      .paddingSymmetric(
                          vertical: Insets.i6,
                          horizontal: index == 0 ? Insets.i6 : Insets.i12)
                ]))).paddingSymmetric(horizontal: Insets.i6).inkWell(
              onTap: () => home.onSelectedValue(index!, context),
            )
      ]);
    });
  }
}
