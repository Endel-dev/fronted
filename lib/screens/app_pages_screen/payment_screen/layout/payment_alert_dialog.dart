import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/payment_screen/layout/payment_widget.dart';

import '../../../../common/assets/index.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_button.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../../widgets/direction_page.dart';

class PaymentAlertDialog extends StatelessWidget {
  const PaymentAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, DashboardProvider>(
        builder: (context2, theme, dashboard, child) {
      //direction layout
      return DirectionLayout(
          //alert dialog
          dChild: AlertDialog(
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.all(Insets.i20),
              content: Container(
                  width: double.infinity,
                  //decoration
                  decoration: PaymentWidget().decorAlertDialog(context),
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      //align set
                      CommonWidget()
                          .topAlign(
                              context,
                              IconButton(
                                  //svg icon
                                  icon: CommonWidget()
                                      .svgAssets(context, svgAssets.iconClose),
                                  onPressed: () => route.pop(context)))
                          .paddingOnly(right: Insets.i15, top: Insets.i10),
                      //gif image
                      PaymentWidget().alertGif(context),
                      Text(language(context, appFonts.congratulation),
                          style: appCss.dmPoppinsMedium18
                              .textColor(isThemeColorReturn(context))),
                      //alert description
                      PaymentWidget()
                          .alertDescription(context)
                          .paddingAll(Insets.i10),
                      ButtonCommon(
                          title: language(context, appFonts.tracking),
                          width: Sizes.s295,
                          height: Sizes.s52,
                          color: appColor(context).appTheme.primaryColor,
                          style: appCss.dmPoppinsRegular16
                              .textColor(appColor(context).appTheme.whiteColor),
                          radius: AppRadius.r10,
                          onTap: () => route.pushNamed(
                              context, routeName.trackingOrder)).paddingOnly(
                          right: Insets.i15, left: Insets.i15, top: Insets.i5),
                      ButtonCommon(
                          title: language(context, appFonts.continueShopping),
                          width: Sizes.s295,
                          height: Sizes.s52,
                          color: appColor(context).appTheme.searchBackground,
                          style: appCss.dmPoppinsRegular16
                              .textColor(appColor(context).appTheme.lightText),
                          radius: AppRadius.r10,
                          onTap: () =>
                              isDashboard(context)).paddingAll(Insets.i15)
                    ])
                  ]))));
    });
  }
}
