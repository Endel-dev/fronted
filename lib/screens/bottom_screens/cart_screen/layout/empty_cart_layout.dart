import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/widgets/direction_page.dart';

import '../../../../common/assets/index.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_empty_page.dart';

class EmptyCartLayout extends StatelessWidget {
  const EmptyCartLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      //direction layout
      return DirectionLayout(
        dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            body: SafeArea(
              //empty screen
                child: CommonEmptyPage(
                    height: Sizes.s150,
                    appName: language(context, appFonts.cart),
                    imagePath: isTheme(context)
                        ? gifAssets.gifCartDark
                        : gifAssets.gifCart,
                    text: language(context, appFonts.emptyCartTitle),
                    textDescription:
                        language(context, appFonts.emptyCartDescription),
                    btnTitle: language(context, appFonts.addNow),
                    onTap: () => route.pop(context)))),
      );
    });
  }
}
