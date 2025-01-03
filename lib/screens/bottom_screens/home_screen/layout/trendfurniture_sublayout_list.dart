import 'package:piggypaisa/screens/bottom_screens/home_screen/layout/trendfurniture_sublayout.dart';

import '../../../../Backend/APIs.dart';
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

import '../../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../../provider/bottom_provider/home_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_appbar_button.dart';
import '../../../../widgets/common_cart/common_cart.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_steper_button.dart';
import '../../../../widgets/common_wishlist_button.dart';
import '../../../../widgets/direction_page.dart';
import 'furniture_list_sublayout.dart';
import 'home_widget.dart';

class TrendFurnitureList extends StatelessWidget {
  final int? index;
  final dynamic data;
  late Future families_data;
   TrendFurnitureList({super.key, this.index, this.data});
  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context, home, theme, child) {
      return FutureBuilder(
        future: Fetch_famalies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==ConnectionState.done) {
            return Container(
                width: MediaQuery.of(context).size.width,
                //decoration
                decoration: HomeWidget().trendFurnitureDecor(context),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Container(
                      padding: const EdgeInsets.all(Insets.i6),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: HomeWidget().trendFurnitureImageDecor(context),
                      child: Icon(Icons.family_restroom_outlined),
                  ),
                  //subText layout
                  Expanded(
                      flex: 5,
                      child: TrendFurnitureSubLayout(index: index, data: data)),
                  Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Row(children: [
                      //svg icon
                      SvgPicture.asset(svgAssets.iconStar),
                      const HSpace(Sizes.s2), //text layout
                      Text(language(context,""),
                          style: appCss.dmPoppinsRegular12
                              .textColor(isThemeColorReturn(context)))
                    ]).paddingOnly(top: Insets.i10, left: Insets.i10),
                    //cart button layout
                    const VSpace(Sizes.s25),
                    CommonCart(
                        imagePath: svgAssets.iconCart,
                        onTap: () => home.moveToCart(
                            index!,
                            home.newTrendFurniture as List<Map<String, dynamic>>,
                            context))
                        .paddingOnly(bottom: Insets.i10, left: Insets.i10)
                  ]).paddingOnly(right: Insets.i8)
                ])).paddingOnly(bottom: Insets.i15);
          }  else
            {
              return Center(
                child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }

        }
      );
    });
  }
}
