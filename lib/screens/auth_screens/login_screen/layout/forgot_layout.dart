import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../../config.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import '../../../../common/extension/spacing.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';
import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../provider/auth_provider/login_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';
import 'login_widget.dart';
class ForgotLayout extends StatelessWidget {
  const ForgotLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context1, login, child) {
      return Stack(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Container(
              height: Sizes.s20,
              width: Sizes.s20,
              //decoration
              decoration: LoginWidget().decor(context),
              child: login.checkedValue
                  //svg icon
                  ? SvgPicture.asset(svgAssets.iconCheck)
                  : null,
            ).inkWell(onTap: () => login.checkedValue = login.isCheck()),
            //text
            Text(language(context, appFonts.rememberMe),
                    style: appCss.dmPoppinsRegular12.textColor(
                        appColor(context).appTheme.txtTransparentColor))
                .paddingSymmetric(horizontal: Insets.i8)
          ]),
          //text layout
          Text(language(context, appFonts.forgotPassword),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsRegular12
                      .textColor(appColor(context).appTheme.linkErrorColor))
              .inkWell(onTap: () => route.pushNamed(context, routeName.forgot))
        ])
      ]);
    });
  }
}
