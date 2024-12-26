import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/common/extension/spacing.dart';

import '../../../common/assets/index.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import '../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../provider/app_pages_provider/details_provider.dart';
import '../../../provider/app_pages_provider/direction_provider.dart';
import '../../../provider/bottom_provider/home_provider.dart';
import '../../../provider/theme_provider/theme_service.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/direction_page.dart';
import 'layout/details_second_layout/details_carousel_layout.dart';
import 'layout/details_second_layout/details_second_appbar.dart';
import 'layout/details_second_layout/details_second_bottom_layout.dart';
import 'layout/details_second_layout/details_second_checkdelivery_layout.dart';
import 'layout/details_second_layout/details_second_detail_layout.dart';
import 'layout/details_second_layout/details_second_sublayout.dart';

class SecondDetailsScreen extends StatelessWidget {
  const SecondDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer4<HomeProvider, DetailsProvider, ThemeService,
            DirectionProvider>(
        builder: (context2, home, details, theme, direction, child) {
      //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              body: SafeArea(
                  child: Stack(
        children: [
          SingleChildScrollView(
              child: Column(children: [
            //appbar layout on details 2 page
            const SecondDetailsAppbar(),
            //carousel layout on details 2 page
            const DetailsSecondCarouselLayout(),
            const VSpace(Sizes.s42),
            Stack(children: [
              //container image layout
              Image.asset(
                isTheme(context)
                    ? imageAssets.imageDetailsSecondBackGroundDark
                    : imageAssets.imageDetailsSecondBackGround,
              ),
               Column(children: [
                //layout of product name,stepper,amount,offer,list layout product
                DetailsSecondSubLayout(),
                //check delivery layout
                DetailsSecondCheckDeliveryLayout(),
                //details layout
                DetailsSecondDetailLayout(),
                VSpace(Sizes.s10),
              ]).paddingOnly(bottom: MediaQuery.of(context).size.height * 0.11)
            ])
          ])),
          //bottom button layout cart
          const Align(
              alignment: Alignment.bottomCenter,
              child: DetailsSecondBottomLayout()),
        ],
      ))));
    });
  }
}
