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

class TermsConditionWidget {
  //common sub text
  Text commonText(context, text) => Text(language(context, text),
      style: appCss.dmPoppinsRegular12
          .textColor(appColor(context).appTheme.lightText));

//divider
  Divider commonDivider(context) => Divider(
        height: Sizes.s1,
        color: isTheme(context)
            ? appColor(context).appTheme.transparentColor
            : appColor(context).appTheme.shadowColorFive,
      );

//common main text
  Text commonMainText(context, text) => Text(language(context, text),
      style: appCss.dmPoppinsSemiBold14.textColor(isThemeColorReturn(context)));

//sub text list data text
  Column subList(context, subData) => Column(
        children: [
          TermsConditionWidget().commonText(context, subData['title']),
          const VSpace(Sizes.s8),
        ],
      );
}
