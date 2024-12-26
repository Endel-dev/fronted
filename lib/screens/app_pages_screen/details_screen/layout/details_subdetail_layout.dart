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

class DetailsSubDetailLayout extends StatelessWidget {
  const DetailsSubDetailLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Column(
        children: [
          //details text layout
          CommonListHeader(
              text: language(context, appFonts.details),
              isClick: details.isDetails,
              onTap: () => details.isClickDown(appFonts.details)),
          //details sub text layout
          details.isDetails == true
              ? CommonContainer(
                  widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //details container description
                      Text(language(context, appFonts.detailDescription),
                          style: appCss.dmPoppinsRegular13
                              .textColor(appColor(context).appTheme.lightText)),
                      //read more text
                      Text(language(context, appFonts.readMore),
                          style: appCss.dmPoppinsBold13
                              .textColor(appColor(context).appTheme.lightText))
                    ]).paddingAll(Insets.i12))
              : Container(),
        ],
      );
    });
  }
}
