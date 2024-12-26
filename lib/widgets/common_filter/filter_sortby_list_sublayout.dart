import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';

import '../../common/theme/scale.dart';
import '../../config.dart';
import '../../plugin_list.dart';
import '../../provider/app_pages_provider/filter_provider.dart';
import '../../utils/common_function.dart';
import 'common_radio.dart';

class FilterSortBySubLayout extends StatelessWidget {
  final int index;
  final dynamic currentItem;
  const FilterSortBySubLayout({super.key, required this.index, this.currentItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(builder: (context1, filter, child) {
      //filter sortby list layout
        return GestureDetector(
          onTap: () => filter.onSelectSortByMethod(index),
          child: Row(children: [
            CommonRadio(
              onTap: () => filter.onSelectSortByMethod(index),
              index: index,
              selectedIndex: filter.selectIndex,
            ).paddingSymmetric(horizontal: Insets.i10),
            Expanded(
              flex: 3,
              child: Text(
                  language(context,
                      currentItem['subtitle'].toString()),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsRegular14.textColor(
                    isThemeColorReturn(context),
                  )),
            )
          ]).paddingOnly(
            left: Insets.i20,
            top: Insets.i20,
          ),
        );
      }
    );
  }
}
