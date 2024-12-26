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
import '../../../../widgets/common_auth_richtext.dart';
import '../../../../widgets/common_widgets.dart';
import 'login_widget.dart';

class RichTextLayoutLogin extends StatelessWidget {
  const RichTextLayoutLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context1,login,child) {
        return Stack(children: [
          Column(children: [
            //integration layout
            // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            //   //facebook integration
            //   LoginWidget()
            //       .socialLogin(context, svgAssets.iconFacebook)
            //       .inkWell(onTap: () =>login.onLogin(context)),
            //   //google integration
            //   LoginWidget()
            //       .socialLogin(context, svgAssets.iconGoogle)
            //       .inkWell(onTap: () => login.onLogin(context)),
            //   //apple integration
            //   LoginWidget()
            //       .socialLogin(context, svgAssets.iconApple)
            //       .inkWell(onTap: () => login.onLogin(context)),
            // ]),
            //sign up click event
            CommonAuthRichText(
              text: language(context, appFonts.accountCreate),
              subtext: language(context, appFonts.signUp),
              onTap: () => route.pushNamed(context, routeName.registration),
            ).paddingSymmetric(vertical: Insets.i30),
          ])
        ]);
      }
    );
  }
}
