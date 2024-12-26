import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import 'common_container.dart';
import 'common_list_header.dart';
import 'common_stepper_container.dart';
import 'details_dimension_table_layout.dart';

class DetailsSubLayoutThird extends StatelessWidget {
  const DetailsSubLayoutThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<DetailsProvider, ThemeService>(
        builder: (context1, details, theme, child) {
      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              //amount
              Text(
                  language(context,
                      '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.detailsPrice))).toStringAsFixed(1)}'),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsSemiBold26
                      .textColor(isThemeColorReturn(context))),
              const HSpace(Sizes.s4),
              //amount discount
              Text(
                  language(context,
                      '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.detailsPrice))).toStringAsFixed(1)}'),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsRegular14
                      .textColor(appColor(context).appTheme.lightText)
                      .textDecoration(TextDecoration.lineThrough,
                          color: appColor(context).appTheme.lightText,
                          thickness: Sizes.s2))
            ]),
            //increment and decrement layout
            const CommonStepperContainer(),
          ],
        ),
        const VSpace(Sizes.s24),
        //details description
        Text(language(context, appFonts.detailsDescription),
            style: appCss.dmPoppinsRegular14
                .textColor(appColor(context).appTheme.lightText)),
        //text display layout and click event
        CommonListHeader(
            text: language(context, appFonts.dimensions),
            isClick: details.isDimensions,
            onTap: () => details.isClickDown(appFonts.dimensions)),
        //dimension layout
        details.isDimensions == true
            ? const CommonContainer(widget: DetailsDimensionTableLayout())
            : Container(),
      ]);
    });
  }
}
