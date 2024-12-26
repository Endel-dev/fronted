import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';
import 'package:piggypaisa/utils/common_function.dart';
import 'package:piggypaisa/widgets/common_appbar_button.dart';

import '../../../../common/assets/index.dart';
import '../../../../common/theme/scale.dart';
import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../routes/index.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../../widgets/common_widgets.dart';

class AppbarSubLayout extends StatelessWidget {
  const AppbarSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DirectionProvider>(builder: (context1, direction, child) {
      return Stack(children: [
        //check out app layout
        CommonAppBar(
          appName: language(context, appFonts.checkOut),
          isIcon: true,
          onPressed: () => route.pop(context),
        ),
        //align set
        CommonWidget().topAlign(
          context,
          //wishlist button layout on appbar
          CommonAppbarButton(
              imagePath: svgAssets.iconWishlist,
              color: ColorFilter.mode(
                  isThemeColorReturn(context), BlendMode.srcIn),
              onPressed: () =>
                  route.pushNamed(context, routeName.wishlist, arg: true)),
        )
      ]).paddingOnly(top: Insets.i10, bottom: Insets.i20);
    });
  }
}
