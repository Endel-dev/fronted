import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/config.dart';
import '../../../../common/theme/scale.dart';
import '../../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/direction_page.dart';
import 'category_top_sublayout.dart';

class CategorySubLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const CategorySubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, DirectionProvider>(
        builder: (context1, theme, direction, child) {
          //direction layout
      return DirectionLayout(
        dChild: Row(children: [
          Stack(children: [
            //category text layout
            CategoryTopSubLayout(index: index, data: data),
            Container(
                    margin: EdgeInsets.only(
                        right: isDirectionRTL(context) || isAr(context)
                            ? MediaQuery.of(context).size.width * 0.71:Sizes.s0,
                        left: isDirectionRTL(context) || isAr(context)
                            ? Sizes.s0
                            : MediaQuery.of(context).size.width * 0.71),
                    height: Sizes.s88,
                    width: Sizes.s90,
                    //image
                    child: Image.asset(data['image'].toString(),
                        fit: BoxFit.scaleDown))
                .paddingSymmetric(vertical: Insets.i10)
          ])
        ]).paddingOnly(bottom: Insets.i15),
      );
    });
  }
}
