import 'package:flutter_svg/svg.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import '../../../../common/assets/index.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';
class CommonOffLayout extends StatelessWidget {
  const CommonOffLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //top align set
    return CommonWidget().topAlign(
      context,
      Stack(children: [
        //svg image direction wise
        SvgPicture.asset(
            isDirectionRTL(context) || isAr(context)
                ? svgAssets.iconOfferRTL
                : svgAssets.iconOfferDetails,
            colorFilter: ColorFilter.mode(
                appColor(context).appTheme.linkErrorColor, BlendMode.srcIn)),
        Column(children: [
          //offer text layout
          Text(
                  language(context, appFonts.offerDiscount) +
                      language(context, appFonts.offerText),
                  style: appCss.dmPoppinsSemiBold12
                      .textColor(appColor(context).appTheme.linkErrorColor))
              .paddingSymmetric(horizontal: Insets.i5),
        ]).paddingAll(Insets.i5)
      ]),
    );
  }
}
