import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../common/theme/scale.dart';
import '../../../provider/app_pages_provider/pagelist_provider.dart';
import '../../../provider/theme_provider/theme_service.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_appbar.dart';
import '../../../widgets/direction_page.dart';
import 'layout/pagelist_sublayout.dart';

class PageList extends StatelessWidget {
  const PageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageListProvider, ThemeService>(
        builder: (context1, pageList, theme, child) {
          //direction layout
      return DirectionLayout(
        dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(children: [
              //appbar for page list page
              CommonAppBar(
                      appName: language(context, appFonts.pageList),
                      isIcon: true,
                      onPressed: () => route.pop(context))
                  .paddingSymmetric(vertical: Insets.i10),
              //page listview list layout
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: appArray.pageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    pageList.selectedIndex = index;
                    final currentItem =
                        appArray.pageList[pageList.selectedIndex]['screen'];
                    return PageListSubLayout(
                        data: appArray.pageList[index], subData: currentItem);
                  }),
              const VSpace(Sizes.s20)
            ]).paddingSymmetric(horizontal: Insets.i20)))),
      );
    });
  }
}
