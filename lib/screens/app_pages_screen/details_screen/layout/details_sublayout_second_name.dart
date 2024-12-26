import '../../../../config.dart';
import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';
import 'common_container.dart';
import 'common_list_header.dart';
import 'common_off_layout.dart';
import 'details_check_delivery_sublayout.dart';
import 'details_second_layout/details_widget.dart';
class DetailsSubLayoutName extends StatelessWidget {
  const DetailsSubLayoutName({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const VSpace(Sizes.s20),
        //divider layout
        DottedLine(
            dashLength: Sizes.s5,
            dashGapLength: Sizes.s2,
            dashColor: isTheme(context)
                ? appColor(context).appTheme.primaryColor
                : appColor(context).appTheme.primaryColor.withOpacity(0.09)).paddingSymmetric(horizontal: Insets.i20),
        const VSpace(Sizes.s20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(language(context, appFonts.chairName),
                style: appCss.dmPoppinsSemiBold16
                    .textColor(isThemeColorReturn(context))).paddingSymmetric(horizontal: Insets.i20),
           //off text layout
            const CommonOffLayout()
          ],
        ),
        const VSpace(Sizes.s4),
        Row(children: [
          Text(language(context, appFonts.ratingFour),
              style: appCss.dmPoppinsRegular14
                  .textColor(isThemeColorReturn(context))),
          const HSpace(Sizes.s2),
          //rating layout
          CommonWidget().ratingBar(),
          const HSpace(Sizes.s10),
          //vertical divider
          SizedBox(
              height: Sizes.s15,
              child: VerticalDivider(
                  color: appColor(context).appTheme.lightText,
                  width: Sizes.s2)),
          const HSpace(Sizes.s10),
          //review text
          Text(language(context, appFonts.review),
              style: appCss.dmPoppinsRegular14
                  .textColor(appColor(context).appTheme.lightText))
        ]).paddingSymmetric(horizontal: Insets.i20),
        const VSpace(Sizes.s23)
      ]);
    });
  }
}
