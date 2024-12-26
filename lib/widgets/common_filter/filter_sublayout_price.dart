import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../config.dart';
import 'package:flutter/material.dart';

import '../../provider/app_pages_provider/filter_provider.dart';
import '../../utils/common_function.dart';



class FilterSubLayoutPrice extends StatelessWidget {
  const FilterSubLayoutPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(builder: (context1, filter, child) {
      //filter price layout
      return Visibility(
          visible: filter.selectedFilterIndex == 2,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                language(context, appFonts.priceRange),
                style: appCss.dmPoppinsRegular14
                    .textColor(isThemeColorReturn(context)),
              ).paddingSymmetric(horizontal: Insets.i10),
              Text(
                      language(
                          context,
                          "\$${filter.valueRange.start.round().toString()} -"
                          " \$${filter.valueRange.end.round().toString()}"),
                      textAlign: TextAlign.end,
                      style: appCss.dmPoppinsRegular14
                          .textColor(isThemeColorReturn(context)))
                  .paddingSymmetric(horizontal: Insets.i20)
            ]),
            //slider for price
            SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.65, // Adjust width as needed
                child: RangeSlider(
                    activeColor: isThemeColorReturn(context),
                    inactiveColor: appColor(context).appTheme.lightText,
                    values: filter.valueRange,
                    min: 0,
                    max: 1000,
                    divisions: 100,
                    onChanged: (RangeValues newValues) {
                      filter.updateValueRangeData(newValues);
                    }))
          ]));
    });
  }
}
