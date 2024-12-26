import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../config.dart';
import 'package:flutter/material.dart';

import '../../provider/app_pages_provider/filter_provider.dart';
import '../../utils/common_function.dart';


class FilterMainSubListText extends StatelessWidget {
  final int index;
  final dynamic data;
  const FilterMainSubListText({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(builder: (context1, filter, child) {
      //filer main sub list layout
      return Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            flex: 2,
            child: Text(language(context, data['title'].toString()),
                overflow: TextOverflow.ellipsis,
                    style: appCss.dmPoppinsMedium14.textColor(
                        filter.selectedFilterIndex == index
                            ? isThemeColorReturn(context)
                            : appColor(context).appTheme.lightText))
                .paddingSymmetric(vertical: Insets.i20, horizontal: Insets.i15),
          ),
          Container(
              height: Sizes.s60,
              width: Sizes.s2,
              color: filter.selectedFilterIndex == index
                  ? isThemeColorReturn(context)
                  : null)
        ]),
        Container(
            height: Sizes.s1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(
                    width: Sizes.s1,
                    color: appColor(context).appTheme.shadowColor)))
      ]);
    });
  }
}
