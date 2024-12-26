import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/page_list/layout/pagelist_innerlist_layout.dart';
import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/pagelist_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';

class PageListSubLayout extends StatelessWidget {
  final dynamic data, subData;

  const PageListSubLayout({super.key, this.data, this.subData});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, PageListProvider>(
        builder: (context1, theme, pageList, child) {
      return Column(children: [
        const VSpace(Sizes.s10),
        Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(Insets.i10),
            //decoration
            decoration: CommonWidget().decorPageList(context),
            child: Text(language(context, data['title']),
                    style: appCss.dmPoppinsMedium16
                        .textColor(isThemeColorReturn(context)))),
        const VSpace(Sizes.s5),
        //listview sub list layout
        Container(
            color: appColor(context).appTheme.backGroundColorMain,
            //inner list layout
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: subData.length,
                itemBuilder: (BuildContext context, int innerIndex) {
                  return PageListInnerListLayout(subData: subData[innerIndex]);
                }))
      ]);
    });
  }
}
