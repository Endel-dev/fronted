import 'package:piggypaisa/screens/app_pages_screen/details_screen/layout/ratingslider.dart';

import '../../../../config.dart';
import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import 'details_color_sublayout.dart';


class DetailsColorLayout extends StatelessWidget {
  const DetailsColorLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const SizedBox(
        width: Sizes.s215,
        //fill liner container layout
        child: RatingSlider(),
      ),
      //color layout list
      Row(
          children: appArray.colorList.asMap().entries.map((e) {
        return DetailsColorSubLayout(data: e.value);
      }).toList()),
    ]).paddingSymmetric(horizontal: Insets.i20);
  }
}
