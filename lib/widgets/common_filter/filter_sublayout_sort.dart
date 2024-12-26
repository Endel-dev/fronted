import 'package:flutter/material.dart';
import 'package:piggypaisa/config.dart';
import 'package:piggypaisa/plugin_list.dart';

import '../../provider/app_pages_provider/filter_provider.dart';
import 'filter_sortby_list_sublayout.dart';

class FilterSortSubLayout extends StatelessWidget {
  final int? index, selectIndex;
  final GestureTapCallback? onTap;
  const FilterSortSubLayout(
      {super.key, this.index, this.selectIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(builder: (context1, filter, child) {
      return Visibility(
          visible: filter.selectedFilterIndex == 0,
          child: Expanded(
              child: SizedBox(
                  height:MediaQuery.of(context).size.height,
                  //list sort by data
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: appArray
                          .filterList[filter.selectedFilterIndex]['filterData']
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentItem =
                            appArray.filterList[filter.selectedFilterIndex]
                                ['filterData'][index];
                        //sort by list
                        return FilterSortBySubLayout(index: index,currentItem: currentItem);
                      }))));
    });
  }
}
