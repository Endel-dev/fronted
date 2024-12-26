import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/routes/index.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../provider/bottom_provider/category_provider.dart';
import '../../../widgets/common_statefulwapper.dart';
import '../../../widgets/direction_page.dart';
import 'layout/chair_appbar_layout.dart';
import 'layout/chair_sublayout_one.dart';

class ChairScreen extends StatelessWidget {
  final int? index;

  const ChairScreen({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, category, child) {
      return StatefulWrapper(
          //load event
          onInit: () => Future.delayed(const Duration(milliseconds: 100))
              .then((_) => category.onReady(context)),
          //direction
          child: DirectionLayout(
            dChild: Scaffold(
                backgroundColor: appColor(context).appTheme.backGroundColorMain,
                body: SafeArea(
                    child: SingleChildScrollView(
                        child: Column(children: [
                  //chair page appbar layout and filter layout
                  const ChairAppbarLayout(),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: category.chairList.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 0.63,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0,
                              maxCrossAxisExtent: 200),
                      itemBuilder: (context, index) {
                        //chair page sub layout
                        return ChairSubLayoutOne(
                            index: index, data: category.chairList[index]);
                      }).paddingSymmetric(horizontal: Insets.i20)
                ])))),
          ));
    });
  }
}
