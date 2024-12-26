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
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_steper_button.dart';
import '../../../../widgets/common_wishlist_button.dart';
import 'furniture_list_sublayout.dart';
import 'home_widget.dart';

class FurnitureListLayout extends StatelessWidget {
  const FurnitureListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      return Column(children: [
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            //Furniture List View
            child: Row(children: [
              //list furniture and list click event
              ...appArray.furnitureType
                  .asMap()
                  .entries
                  .map((e) => FurnitureListSubLayout(
                        index: e.key,
                        data: e.value,
                      ))
                  .toList()
            ])).paddingOnly(left: Insets.i15),
        const VSpace(Sizes.s25),
        //new arrival name display
        HomeWidget().listNameCommon(
            context,language(context, appFonts.newArrival))
            .paddingSymmetric(horizontal: Insets.i20),
        const VSpace(Sizes.s15)
      ]);
    });
  }
}
