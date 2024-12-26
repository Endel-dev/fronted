import 'package:piggypaisa/common/common_path_list.dart';

import '../../config.dart';
import 'package:flutter/material.dart';

import '../../utils/common_function.dart';
import '../common_appbar.dart';
class FilterAppBar extends StatelessWidget {
  const FilterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //appbar on filter
        CommonAppBar(
          appName: language(context, appFonts.filter),
          isIcon: true,
          onPressed: () => route.pop(context),
        ).paddingSymmetric(vertical: Insets.i10, horizontal: Insets.i20),
        Container(
            height: Sizes.s1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                width: Sizes.s1,
                color: appColor(context).appTheme.shadowColor,
              ),
            )),
      ],
    );
  }
}
