import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/common_function.dart';
import '../common_stepper_container.dart';

class DetailsSecondSubLayoutOne extends StatelessWidget {
  const DetailsSecondSubLayoutOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Text(
            //product amount
            language(context,
                '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.detailsPrice))).toStringAsFixed(1)}'),
            overflow: TextOverflow.ellipsis,
            style: appCss.dmPoppinsSemiBold26
                .textColor(isThemeColorReturn(context))),
        const HSpace(Sizes.s4),
        Text(
            //product discount amount
            language(context,
                '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.detailsPrice))).toStringAsFixed(1)}'),
            overflow: TextOverflow.ellipsis,
            style: appCss.dmPoppinsRegular14
                .textColor(appColor(context).appTheme.lightText)
                .textDecoration(TextDecoration.lineThrough,
                    color: appColor(context).appTheme.lightText,
                    thickness: Sizes.s2))
      ]),
      //stepper layout increment decrement
      const CommonStepperContainer(),
    ]);
  }
}
