import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';

import '../common/assets/index.dart';
import '../config.dart';
import '../plugin_list.dart';
import '../provider/bottom_provider/cart_provider.dart';
import '../provider/theme_provider/theme_service.dart';
import '../routes/index.dart';
import '../utils/common_function.dart';
import 'common_widgets.dart';

class CustomSteeper extends StatelessWidget {
  final GestureTapCallback onPressedDecrement;
  final GestureTapCallback onPressedIncrement;
  final int? qty;

  const CustomSteeper(
      {super.key,
      required this.onPressedDecrement,
      required this.onPressedIncrement,
      this.qty});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartProvider, ThemeService>(
        builder: (context, cart, theme, child) {
          //stepper for increment and decrement
      return Container(
          width: MediaQuery.of(context).size.height * 0.12,
          height: MediaQuery.of(context).size.height * 0.038,
          margin: const EdgeInsets.only(right: 1),
          decoration: CommonWidget().stepperDecor(context),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
                onTap: onPressedDecrement,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.032,
                    width: MediaQuery.of(context).size.height * 0.032,
                    decoration: CommonWidget().circleDecor(
                        context, appColor(context).appTheme.searchBackground),
                    child: CommonWidget()
                        .svgAssets(context, svgAssets.iconDecrement))),
            Text(language(context, qty.toString()),
                style: appCss.dmPoppinsRegular12
                    .textColor(appColor(context).appTheme.primaryColor)),
            GestureDetector(
                onTap: onPressedIncrement,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.032,
                    width: MediaQuery.of(context).size.height * 0.032,
                    decoration: CommonWidget().circleDecor(
                        context, appColor(context).appTheme.primaryColor),
                    child: SvgPicture.asset(svgAssets.iconIncrement,
                        colorFilter: ColorFilter.mode(
                            appColor(context).appTheme.whiteColor,
                            BlendMode.srcIn),
                        fit: BoxFit.scaleDown)))
          ]));
    });
  }
}
