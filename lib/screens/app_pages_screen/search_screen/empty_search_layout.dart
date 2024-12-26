import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/utils/common_function.dart';
import '../../../common/assets/index.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:flutter/material.dart';

import '../../../provider/app_pages_provider/direction_provider.dart';
import '../../../provider/theme_provider/theme_service.dart';
import '../../../routes/index.dart';
import '../../../widgets/common_empty_page.dart';
import '../../../widgets/direction_page.dart';

class EmptySearchLayout extends StatelessWidget {
  const EmptySearchLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, DirectionProvider>(
        builder: (context1, theme, direction, child) {
      return DirectionLayout(
        dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            body: SafeArea(
                //search empty layout
                child: CommonEmptyPage(
              height: Sizes.s180,
              appName: language(context, appFonts.search),
              imagePath: isTheme(context)
                  ? gifAssets.gifSearchDark
                  : gifAssets.gifEmptySearch,
              text: language(context, appFonts.searchTitle),
              textDescription: language(context, appFonts.searchDescription),
              isVisible: false,
              btnTitle: language(context, appFonts.search),
            ))),
      );
    });
  }
}
