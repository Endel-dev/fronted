import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../../common/assets/index.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:flutter/material.dart';

import '../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../provider/bottom_provider/profile_provider.dart';
import '../../../provider/theme_provider/theme_service.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_edit_button.dart';
import '../../../widgets/common_statefulwapper.dart';
import '../../../widgets/direction_page.dart';
import 'layout/profile_appbar_layout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<DashboardProvider, ThemeService, ProfileProvider>(
        builder: (context1, dashboard, theme, profile, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 50))
              .then((_) => profile.onReady(context)),

              child: DirectionLayout(
                dChild: Scaffold(
                    backgroundColor:
                        appColor(context).appTheme.backGroundColorMain,
                    body: SafeArea(
                        child: Stack(children: [
                      const ProfileAppbarLayout(),
                      Row(children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.075),
                          height: Sizes.s90,
                          width: Sizes.s90,
                          child: Image.asset(imageAssets.imageProfilePic,
                              fit: BoxFit.fill),
                        ).paddingSymmetric(
                            vertical: Insets.i5, horizontal: Insets.i20)
                      ]),
                      Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.107),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(language(context, appFonts.profileName),
                                        style: appCss.dmPoppinsMedium15
                                            .textColor(
                                                isThemeColorReturn(context)))
                                    .paddingSymmetric(horizontal: Insets.i90),
                                //edit button and click event
                                CommonEditButton(
                                    imagePath: svgAssets.iconEdit,
                                    onPressed: () => route.pushNamed(
                                        context, routeName.profileSetting))
                              ]).paddingSymmetric(horizontal: Insets.i20))
                    ]))),
              ));
    });
  }
}
