import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../common/assets/index.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';
import 'details_second_layout/details_widget.dart';

class CommonStepperContainer extends StatelessWidget {
  const CommonStepperContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Container(
          height: Sizes.s44,
          width: Sizes.s135,
          //stepper container decoration
          decoration: DetailsWidget().stepperContainer(context),
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                //svg image
                CommonWidget()
                    .svgAssets(context, svgAssets.iconDecrement)
                    .inkWell(
                        onTap: () => details.decrementProduct(details.qty)),
                //vertical divider
                DetailsWidget().verticalDivider(context),
                //qty text
                Text(language(context, details.qty.toString()),
                    textAlign: TextAlign.center,
                    style: appCss.dmPoppinsRegular16
                        .textColor(isThemeColorReturn(context))),
                //vertical divider
                DetailsWidget().verticalDivider(context),
                //svg image
                CommonWidget()
                    .svgAssets(context, svgAssets.iconIncrement)
                    .inkWell(onTap: () => details.incrementProduct(details.qty))
              ]).paddingSymmetric(horizontal: Insets.i12)));
    });
  }
}
