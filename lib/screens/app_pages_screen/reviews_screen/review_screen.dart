import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/common/extension/spacing.dart';
import 'package:piggypaisa/config.dart';
import 'package:flutter/material.dart';

import '../../../common/theme/scale.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/direction_page.dart';
import '../details_screen/layout/common_container.dart';
import '../details_screen/layout/details_review_sublayout.dart';
class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isTheme(context)
            ? appColor(context).appTheme.backGroundColorMain
            : null,
        body: SafeArea(
            child: SingleChildScrollView(
              //direction layout
                child: DirectionLayout(
                    dChild: Column(children: [
          const VSpace(Sizes.s5),
          //appbar for customer review ui
          CommonAppBar(
            appName: language(context, appFonts.customerReviews),
            isIcon: true,
            onPressed: () => route.pop(context),
          ),
          const VSpace(Sizes.s10),
          //list of customer review
          ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: appArray.reviewCustomerList.length,
              itemBuilder: (BuildContext context, int index) {
                return CommonContainer(
                        widget: DetailsReviewSubLayout(
                            index: index,
                            data: appArray.reviewCustomerList[index]))
                    .paddingOnly(bottom: Insets.i10);
              })
        ]).paddingSymmetric(horizontal: Insets.i20)))));
  }
}
