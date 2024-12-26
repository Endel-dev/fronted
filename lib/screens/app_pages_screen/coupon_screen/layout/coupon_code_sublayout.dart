import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/coupon_screen/layout/coupon_widget.dart';

import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../utils/common_function.dart';

class CouponCodeSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const CouponCodeSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //layout of top text coupon code
        CouponWidget().textDescription(context, data).paddingOnly(
            top: MediaQuery.of(context).size.height * 0.01,
            right: isDirectionRTL(context) || isAr(context)
                ? MediaQuery.of(context).size.width * 0.16
                : Sizes.s0,
            left: isDirectionRTL(context) || isAr(context)
                ? Sizes.s0
                : MediaQuery.of(context).size.width * 0.16,
            bottom: Insets.i10),
        //divider of coupon code
        CouponWidget().divider(context).paddingOnly(
            right: isDirectionRTL(context) || isAr(context)
                ? MediaQuery.of(context).size.width * 0.15
                : Sizes.s0,
            left: isDirectionRTL(context) || isAr(context)
                ? Sizes.s0
                : MediaQuery.of(context).size.width * 0.15),

        //apply and code of apply layout
        CouponWidget().codeApply(context, data).paddingOnly(
            top: MediaQuery.of(context).size.height * 0.012,
            right: isDirectionRTL(context) || isAr(context)
                ? MediaQuery.of(context).size.width * 0.16
                : Sizes.s0,
            left: isDirectionRTL(context) || isAr(context)
                ? Sizes.s0
                : MediaQuery.of(context).size.width * 0.16)
      ],
    ).paddingSymmetric(horizontal: Insets.i20);
  }
}
