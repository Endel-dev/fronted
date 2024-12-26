import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/terms_condition_screen/layout/terms_condition_widget.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

class TermsConditionSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;
  final dynamic subData;

  const TermsConditionSubLayout({super.key, this.data, this.subData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //terms condition main text title
        TermsConditionWidget().commonMainText(context, data['mainTitle']),
        const VSpace(Sizes.s5),
        //terms condition inner text
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: subData.length,
            itemBuilder: (BuildContext context, int innerIndex) {
              //sub text display
              return TermsConditionWidget()
                  .subList(context, subData[innerIndex]);
            }),
        if (index!= appArray.termsConditionList.length - 1)
          //divider
          TermsConditionWidget()
              .commonDivider(context)
              .paddingSymmetric(vertical: Insets.i15),
      ],
    );
  }
}
