import 'package:piggypaisa/plugin_list.dart';
import '../../config.dart';
import 'package:flutter/material.dart';

import '../../provider/app_pages_provider/filter_provider.dart';
import 'filter_dimension_list_sublayout.dart';

class FilterSubLayoutDimension extends StatelessWidget {
  const FilterSubLayoutDimension({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(builder: (context1, filter, child) {
      //visibility layout
      return Visibility(
          visible: filter.selectedFilterIndex == 3,
          child: Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
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
                        //dimension list
                        return FilterDimensionListSubLayout(currentItem:currentItem);
                      }))));
    });
  }
}
