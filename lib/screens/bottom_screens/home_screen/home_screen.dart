import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/config.dart';
import '../../../common/extension/spacing.dart';
import '../../../common/theme/scale.dart';
import '../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../provider/app_pages_provider/direction_provider.dart';
import '../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../provider/bottom_provider/home_provider.dart';
import '../../../provider/theme_provider/theme_service.dart';
import '../../../routes/index.dart';
import '../../../widgets/common_statefulwapper.dart';
import '../../../widgets/direction_page.dart';
import 'layout/furniture_decor_layout.dart';
import 'layout/furniture_list_layout.dart';
import 'layout/home_screen_layout.dart';
import 'layout/home_widget.dart';
import 'layout/newarrivals_layout.dart';
import 'layout/offerzone_layout.dart';
import 'layout/trendfurniture_layout.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer4<HomeProvider, ThemeService, DashboardProvider,
            DirectionProvider>(
        builder: (context1, home, theme, dashboard, direction, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 1000))
              .then((_) => home.onReady()),
          child: DirectionLayout(
              dChild: Scaffold(
                  backgroundColor:
                      appColor(context).appTheme.backGroundColorMain,
                  body: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(
                              children: [
                                Text("welcome")
                    // Home screen top layout
                    // const HomeScreenLayout(),
                    // //listview furniture
                    // const FurnitureListLayout(),
                    // Column(children: [
                    //   //newArrival list
                    //   const NewArrivalLayout(),
                    //   //trendFurniture list
                    //   const TrendFurnitureLayout(),
                    //   const VSpace(Sizes.s10),
                    //   //bannerlayout
                    //   HomeWidget().banner(context, imageAssets.bannerTwo),
                    //   const VSpace(Sizes.s25)
                    // ]).paddingSymmetric(horizontal: Insets.i20),
                    // //offerzone Layout
                    // const OfferZoneLayout(),
                    // Column(children: [
                    //   //furniture decore layout
                    //   const FurnitureDecorLayout(),
                    //   const VSpace(Sizes.s10),
                    //   //grid layout bottom home page
                    //   HomeWidget().bannerSquare(context)
                    // ]).paddingOnly(
                    //     left: Insets.i10, right: Insets.i10, bottom: Insets.i20)
                  ]))))));
    });
  }
}
