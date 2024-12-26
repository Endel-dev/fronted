import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../config.dart';
import '../../provider/app_pages_provider/direction_provider.dart';
import '../../provider/app_pages_provider/filter_provider.dart';
import '../../routes/index.dart';
import '../../utils/common_function.dart';
import '../common_widgets.dart';
import '../direction_page.dart';
import 'filter_button_sublayout.dart';
import 'filter_mainlist_layout.dart';
import 'filter_sublayout_color.dart';
import 'filter_sublayout_dimension.dart';
import 'filter_sublayout_price.dart';
import 'filter_sublayout_sort.dart';

class FurnitureFilterLayout extends StatelessWidget {
  const FurnitureFilterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<FilterProvider, DirectionProvider>(
        builder: (context2, filter, direction, child) {
      return DirectionLayout(
        dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            //appbar text
            appBar: AppBar(
              title: Text(language(context, appFonts.filter),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsSemiBold16
                      .textColor(isThemeColorReturn(context))),
              centerTitle: true,
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              // appbar icon
              leading: IconButton(
                  icon: CommonWidget()
                      .svgImage(context, svgAssets.iconNextArrow,
                          svgAssets.iconBackArrow)
                      .paddingOnly(left: Insets.i10),
                  onPressed: () => route.pop(context)),
            ),
            body:  SafeArea(
                child: Stack(children: [
              //FilterAppBar(),
               Row(
                children: [
                  //filter list
                  FilterMainListLayout(),
                  //filter sublist sortby
                  FilterSortSubLayout(),
                  //filter sublist color
                  FilterColorSubLayout(),
                  //filter sublist price
                  FilterSubLayoutPrice(),
                  //filter sublist dimension
                  FilterSubLayoutDimension(),
                ],
              ),
              //bottom button layout
              Align(
                  alignment: Alignment.bottomCenter,
                  child: FilterButtonSubLayout()),
            ]))),
      );
    });
  }
}
