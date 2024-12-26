import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../common/theme/scale.dart';
import '../../config.dart';
import 'package:flutter/material.dart';

import '../../provider/app_pages_provider/filter_provider.dart';
import '../../routes/index.dart';
import '../../utils/common_function.dart';
import 'checkbox_common.dart';
import 'filter_color_list_sublayout.dart';
class FilterColorSubLayout extends StatelessWidget {
  const FilterColorSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(builder: (context1, filter, child) {
      return Visibility(
          visible: filter.selectedFilterIndex == 1,
          child: Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      //filter color layout select all option layout
                      Container(
                          height: MediaQuery.of(context).size.height * 0.055,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppRadius.r6),
                              border: Border.all(
                                  width: Sizes.s1,
                                  color: appColor(context)
                                      .appTheme
                                      .shadowColorSix),
                              color:
                                  appColor(context).appTheme.searchBackground),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(language(context, appFonts.selectAll),
                                  style: appCss.dmPoppinsRegular14
                                      .textColor(isThemeColorReturn(context))).paddingSymmetric(horizontal: Insets.i8),
                              CheckBoxCommon(
                                  isCheck: filter.isSelectColor,
                                  onTap: () => filter.isSelectAll(appArray
                                      .filterList[filter.selectedFilterIndex]
                                  ['filterData']))
                                  .paddingSymmetric(horizontal: Insets.i10)
                            ],
                          )).inkWell(onTap: ()=>filter.isSelectAll(appArray
                          .filterList[filter.selectedFilterIndex]
                      ['filterData'])).paddingOnly(
                  left: Insets.i20, top: Insets.i15, right: Insets.i20),
                      //color list layout
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: appArray
                              .filterList[filter.selectedFilterIndex]
                                  ['filterData']
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            final currentItem =
                                appArray.filterList[filter.selectedFilterIndex]
                                    ['filterData'][index];
                            //color list
                            return FilterColorListSubLayout(
                                currentItem: currentItem);
                          }),
                    ],
                  ))));
    });
  }
}
