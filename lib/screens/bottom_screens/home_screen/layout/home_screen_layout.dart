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
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_steper_button.dart';
import '../../../../widgets/common_wishlist_button.dart';
import '../../../../widgets/direction_page.dart';
import 'furniture_list_sublayout.dart';
import 'home_appbar_layout.dart';
import 'home_widget.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<HomeProvider>(
      builder: (context1,home,child) {
        return Column(children: [
          VSpace(MediaQuery.of(context).size.height * 0.02),
          //Home page Appbar
          const HomeAppBarLayout(),
          const VSpace(Sizes.s25),
          //filter layout
          CommonWidget().filterLayout(home.searchCtrl, context),
          const VSpace(Sizes.s25),
          //banner
         HomeWidget().banner(context, imageAssets.bannerOne),
          const VSpace(Sizes.s25)
        ]).paddingSymmetric(horizontal: Insets.i20);
      }
    );
  }
}
