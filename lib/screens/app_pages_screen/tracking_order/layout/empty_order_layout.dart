import 'package:piggypaisa/plugin_list.dart';
import '../../../../common/assets/index.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_empty_page.dart';
import '../../../../widgets/direction_page.dart';


class EmptyOrderLayout extends StatelessWidget {
  const EmptyOrderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      //direction
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              body: SafeArea(
                  //empty order layout
                  child: CommonEmptyPage(
                      height: Sizes.s245,
                      appName: language(context, appFonts.orderHistory),
                      imagePath: isTheme(context)
                          ? gifAssets.gifOrderDark
                          : gifAssets.gifEmptyOrderList,
                      text: language(context, appFonts.orderHistoryTitle),
                      textDescription:
                          language(context, appFonts.orderHistoryDescription),
                      isVisible: false,
                      btnTitle: language(context, appFonts.search)))));
    });
  }
}
