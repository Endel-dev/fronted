import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';
import 'cart_widget.dart';

class CartSubTextRowLayout extends StatelessWidget {
  final dynamic data;

  const CartSubTextRowLayout({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      return Row(
        children: [
          //text layout
          Text(language(context, appFonts.qty),
              style: appCss.dmPoppinsRegular12.textColor(isTheme(context)
                  ? appColor(context).appTheme.whiteColor.withOpacity(0.40)
                  : appColor(context).appTheme.primaryColor.withOpacity(0.40))),
          //text layout
          Text(language(context, data["qty"].toString()),
              style: appCss.dmPoppinsRegular12.textColor(isTheme(context)
                  ? appColor(context).appTheme.whiteColor.withOpacity(0.40)
                  : appColor(context).appTheme.primaryColor.withOpacity(0.40))),
          //svg icon
          CommonWidget()
              .svgAssets(context, svgAssets.iconLine)
              .paddingSymmetric(horizontal: Insets.i10),
          Container(
              height: Sizes.s13,
              width: Sizes.s13,
              //color decor
              decoration: CartWidget().colorDecor(context)),
          const HSpace(Sizes.s5),
          //text layout
          Text(language(context, data['colorName'].toString()),
              style: appCss.dmPoppinsRegular12.textColor(isTheme(context)
                  ? appColor(context).appTheme.whiteColor.withOpacity(0.40)
                  : appColor(context).appTheme.primaryColor.withOpacity(0.40)))
        ],
      );
    });
  }
}
