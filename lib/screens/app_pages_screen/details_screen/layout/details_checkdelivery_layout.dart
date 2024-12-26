import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';
import 'common_container.dart';
import 'common_list_header.dart';
import 'details_check_delivery_sublayout.dart';
import 'details_second_layout/details_widget.dart';

class DetailsCheckDeliveryLayout extends StatelessWidget {
  const DetailsCheckDeliveryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<DetailsProvider, ThemeService, DirectionProvider>(
        builder: (context1, details, theme, direction, child) {
      return Column(children: [
        //check delivery text layout and click event
        CommonListHeader(
            text: language(context, appFonts.checkDelivery),
            isClick: details.isCheckDelivery,
            onTap: () => details.isClickDown(appFonts.checkDelivery)),
        details.isCheckDelivery == true
            ? Column(children: [
                //check delivery textfield
                DetailsWidget().checkDeliveryTextField(context),
                const VSpace(Sizes.s15),
                Stack(children: [
                  //check delivery list layout
                  CommonContainer(
                      height: Sizes.s56,
                      widget: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: appArray.checkDeliveryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DetailsCheckDeliverySubLayout(
                                index: index,
                                data: appArray.checkDeliveryList[index]);
                          }).paddingAll(Insets.i12))
                ])
              ])
            : Container()
      ]);
    });
  }
}
