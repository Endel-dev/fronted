import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/shipping_screen/layout/shipping_widget.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_button.dart';

class AddAddressButtonSubLayout extends StatelessWidget {
  const AddAddressButtonSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Stack(
        children: [
          Container(
              height: Sizes.s73,
              padding: const EdgeInsets.all(Insets.i10),
              width: MediaQuery.of(context).size.width,
              //decoration
              decoration: ShippingWidget().decorShipping(context),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //button cancel
                    ButtonCommon(
                        title: language(context, appFonts.cancle),
                        width: Sizes.s157,
                        height: Sizes.s48,
                        color: isTheme(context)
                            ? appColor(context).appTheme.transparentColor
                            : appColor(context).appTheme.searchBackground,
                        style: appCss.dmPoppinsRegular16
                            .textColor(appColor(context).appTheme.lightText),
                        radius: AppRadius.r10,
                        onTap: () => route.pop(context)),
                    //button add
                    ButtonCommon(
                        title: language(context, appFonts.add),
                        width: Sizes.s157,
                        height: Sizes.s48,
                        color: isThemeButtonColorReturn(context),
                        style: appCss.dmPoppinsRegular16
                            .textColor(isThemeColorReturnDark(context)),
                        radius: AppRadius.r10,
                        onTap: () => route.pop(context))
                  ]))
        ],
      );
    });
  }
}
