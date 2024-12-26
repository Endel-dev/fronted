
import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';

import '../../../common/assets/index.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import '../../../provider/bottom_provider/category_provider.dart';
import '../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../provider/theme_provider/theme_service.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/common_appbar_button.dart';
import '../../../widgets/common_statefulwapper.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/direction_page.dart';
import '../../../widgets/search_text_filed_common.dart';
import 'layout/category_sublayout.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<CategoryProvider, ThemeService, DashboardProvider>(
        builder: (context1, category, theme, dashboard, child) {
          //page load
      return StatefulWrapper(
        onInit: () => Future.delayed(const Duration(milliseconds: 10))
            .then((_) => category.onReady(context)),
        //device back press
            child: DirectionLayout(
                dChild: Scaffold(
                    backgroundColor:
                        appColor(context).appTheme.backGroundColorMain,
                    body: SafeArea(
                        child: SingleChildScrollView(
                            child: Column(children: [
                      Stack(children: [
                        //appbar layout
                        CommonAppBar(
                            appName: language(context, appFonts.categories)),
                        //notification button layout
                        CommonWidget().topAlign(
                            context,
                            //appbar button notification
                            CommonAppbarButton(
                                imagePath: isTheme(context)
                                    ? svgAssets.iconTopNotificationWhite
                                    : svgAssets.iconTopNotification,
                                onPressed: () => route.pushNamed(
                                    context, routeName.notification)))
                      ]).paddingOnly(
                          top: Insets.i15, left: Insets.i20, right: Insets.i20),
                      //search layout
                      SizedBox(
                              height: Sizes.s48,
                          //text filed
                              child: SearchTextFieldCommon(
                                  controller: category.searchCtrl))
                          .paddingSymmetric(
                              horizontal: Insets.i20, vertical: Insets.i25),
                      //category list layour
                      ...appArray.categories
                          .asMap()
                          .entries
                          .map((e) => CategorySubLayout(
                                index: e.key,
                                data: e.value,
                              ))
                          .toList()
                    ]))))),
      );
    });
  }
}
