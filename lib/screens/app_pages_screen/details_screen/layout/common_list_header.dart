import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../utils/common_function.dart';
import 'details_second_layout/details_widget.dart';

class CommonListHeader extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  final bool? isClick;

  const CommonListHeader(
      {super.key, required this.text, this.onTap, this.isClick});

  @override
  Widget build(BuildContext context) {
    //common list header
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Column(children: [
        const VSpace(Sizes.s21),
        GestureDetector(
            onTap: onTap,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text,
                      style: appCss.dmPoppinsMedium14
                          .textColor(isThemeColorReturn(context))),
                  //svg image
                  SvgPicture.asset(
                      isClick == true
                          ? svgAssets.iconArrowUp
                          : svgAssets.iconArrowDown,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                          isThemeColorReturn(context), BlendMode.srcIn))
                ])),
        const VSpace(Sizes.s8),
        //divider
        DetailsWidget().commonDivider(context),
        const VSpace(Sizes.s15)
      ]);
    });
  }
}
