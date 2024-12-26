import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../../../common/extension/spacing.dart';
import '../../../../../common/theme/scale.dart';
import '../../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../../provider/theme_provider/theme_service.dart';
import '../../../../../routes/index.dart';
import '../../../../../utils/common_function.dart';
import 'details_checkdelivery_sublayout_one.dart';
import 'details_widget.dart';

class DetailsSecondCheckDeliveryLayout extends StatelessWidget {
  const DetailsSecondCheckDeliveryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, DirectionProvider>(
        builder: (context1, theme, direction, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: appColor(context).appTheme.searchBackground,
        padding: const EdgeInsets.symmetric(horizontal: Insets.i20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const VSpace(Sizes.s20),
          //check delivery text
          Text(language(context, appFonts.checkDelivery),
              style: appCss.dmPoppinsSemiBold14
                  .textColor(isThemeColorReturn(context))),
          const VSpace(Sizes.s4),
          //check delivery Description text
          Text(language(context, appFonts.checkDeliveryDescription),
              style: appCss.dmPoppinsRegular14
                  .textColor(appColor(context).appTheme.lightText)),
          const VSpace(Sizes.s12),
          //check delivery textfield
          DetailsWidget().checkDeliveryTextField(context),
          const VSpace(Sizes.s20),
          //check delivery list layout
          Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: appArray.checkDeliveryList.asMap().entries.map((e) {
                    return DetailsCheckDeliverySubLayoutOne(data: e.value);
                  }).toList())
              .paddingOnly(bottom: Insets.i20)
        ]),
      );
    });
  }
}
