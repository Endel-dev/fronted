import '../../../../config.dart';
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
class HelpWidget {
  //sublist text
  Column subLayoutList(context, subtitle) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(language(context, subtitle),
            style: appCss.dmPoppinsRegular12
                .textColor(appColor(context).appTheme.lightText)),
        const VSpace(Sizes.s5)
      ]);

//decor main list
  BoxDecoration decor(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r4),
      color: appColor(context).appTheme.searchBackground);
}
