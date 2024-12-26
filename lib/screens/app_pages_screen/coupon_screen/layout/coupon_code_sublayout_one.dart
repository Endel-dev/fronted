import 'dart:math';

import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import 'coupon_code_sublayout.dart';
import 'coupon_widget.dart';

class CouponCodeSubLayoutOne extends StatelessWidget {
  final int index;
  final dynamic data;

  const CouponCodeSubLayoutOne({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Stack(children: [
        //layout of image
        isDirectionRTL(context) || isAr(context)
            ? Transform.rotate(
                angle: 180 * pi / 180,
                //image layout
                child: CouponWidget().image(context),
              )
            //  //image layout
            : CouponWidget().image(context),
        //layout of offer text
        CouponWidget().offerText(context, data).paddingOnly(
            right: isDirectionRTL(context) || isAr(context)
                ? MediaQuery.of(context).size.width * 0.012
                : Sizes.s0,
            left: isDirectionRTL(context) || isAr(context)
                ? Sizes.s0
                : MediaQuery.of(context).size.width * 0.04),

        //layout of offer text off
        isDirectionRTL(context) || isAr(context)
            ? Positioned(
                right: MediaQuery.of(context).size.width * 0.02,
                //off text layout
                child: CouponWidget().off(context, data).paddingOnly(
                    top: Insets.i25,
                    right: MediaQuery.of(context).size.width * 0.05))
            : Positioned(
                left: MediaQuery.of(context).size.width * 0.02,
                //off text layout
                child: CouponWidget().off(context, data).paddingOnly(
                    top: Insets.i25,
                    left: MediaQuery.of(context).size.width * 0.05)),
        //layout of subtext on coupon code
        CouponCodeSubLayout(index: index, data: data)
      ]).paddingOnly(bottom: Insets.i20);
    });
  }
}
