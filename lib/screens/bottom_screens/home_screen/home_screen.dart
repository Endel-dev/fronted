import 'package:piggypaisa/Backend/APIs.dart';
import 'package:piggypaisa/Global_values.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import '../../../common/extension/spacing.dart';
import '../../../common/theme/scale.dart';
import '../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../provider/app_pages_provider/direction_provider.dart';
import '../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../provider/bottom_provider/home_provider.dart';
import '../../../provider/theme_provider/theme_service.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_statefulwapper.dart';
import '../../../widgets/direction_page.dart';
import 'layout/home_screen_layout.dart';
import 'layout/home_widget.dart';
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
                                    // Home screen top layout
                                    const HomeScreenLayout(),
                                    VSpace(Sizes.s15),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: HomeWidget().listNameCommon(
                                          context,language(context, "Children")),
                                    ),
                                    // //listview furniture
                                    // const FurnitureListLayout(),
                                    Column(children: [
                                      FutureBuilder(
                                        future: Fetch_children(),
                                        builder: (context, snapshot) {
                                          return SizedBox(
                                              height: 120, // Height to fit avatars and names
                                              child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: children.length,
                                                itemBuilder: (context, index) {
                                                  // final user = users[index];
                                                  return Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                    child: Column(
                                                      children: [
                                                        // Circle Avatar
                                                        CircleAvatar(
                                                          radius: 40,
                                                          backgroundColor:Colors.grey,
                                                          child: Icon(Icons.child_care_rounded)
                                                        ),
                                                        SizedBox(height: 8),
                                                        // Name Text
                                                        Text(
                                                          children[index]['name'],
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.black,
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                          );
                                        }
                                      ),
                                      //newArrival list
                                      // const NewArrivalLayout(),
                                      //trendFurniture list
                                      const TrendFurnitureLayout(),
                                      const VSpace(Sizes.s10),
                                      //bannerlayout
                                      // HomeWidget().banner(context, imageAssets.bannerTwo),
                                      const VSpace(Sizes.s25)
                                    ]).paddingSymmetric(horizontal: Insets.i20),
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
