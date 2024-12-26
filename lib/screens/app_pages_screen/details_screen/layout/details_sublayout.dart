import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/details_screen/layout/details_checkdelivery_layout.dart';
import 'package:piggypaisa/screens/app_pages_screen/details_screen/layout/details_subdetail_layout.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../utils/common_function.dart';
import '../../../bottom_screens/home_screen/layout/home_widget.dart';
import '../../../bottom_screens/home_screen/layout/newarrivals_layout.dart';
import 'details_color_layout.dart';
import 'details_review_layout.dart';
import 'details_second_layout/details_widget.dart';
import 'details_sublayout_carousel.dart';
import 'details_sublayout_one.dart';
import 'details_sublayout_second_name.dart';
import 'details_sublayout_third.dart';

class DetailsSubLayout extends StatelessWidget {
  const DetailsSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Stack(children: [
        //appbar on details page
        const DetailSubLayoutOne(),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const VSpace(Sizes.s112),
          //carousel layout on details page
          const DetailsSubLayoutCarousel(),
          const VSpace(Sizes.s35),
          //liner fill line layout and color layout
          const DetailsColorLayout(),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //top name and off text layout
            const DetailsSubLayoutName(),
            Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //count stepper, dimension layout
                  const DetailsSubLayoutThird(),
                  //check delivery layout
                  const DetailsCheckDeliveryLayout(),
                  //Details layout
                  const DetailsSubDetailLayout(),
                  //review layout
                  const DetailsReviewLayout(),
                  //write review  and similar text layout
                  DetailsWidget().writeReview(context, details),
                ],
              ).paddingOnly(left: Insets.i20, right: Insets.i20),
              VSpace(isTheme(context) ? Sizes.s0 : Sizes.s10),
              Container(
                  color: appColor(context).appTheme.backGroundColorMain,
                  child: Column(
                    children: [
                      const VSpace(Sizes.s10),
                      //similar text layout
                      HomeWidget().listNameCommon(
                          context, language(context, appFonts.similarProduct)),
                      const VSpace(Sizes.s15),
                      //similar product
                      const NewArrivalLayout(),
                    ],
                  ).paddingOnly(
                      left: Insets.i20,
                      right: Insets.i20,
                      bottom: MediaQuery.of(context).size.height * 0.11))
            ])
          ])
        ])
      ]);
    });
  }
}
