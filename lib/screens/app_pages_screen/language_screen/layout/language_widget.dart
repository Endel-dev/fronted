import '../../../../config.dart';
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
class LanguageWidget {
  //radio button decor
  BoxDecoration decor(context) => BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: appColor(context).appTheme.primaryColor),
      color: appColor(context).appTheme.whiteColor);

//Radio button border decor
  BoxDecoration decorWithOutColor(context) => BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: appColor(context).appTheme.primaryColor));
}
