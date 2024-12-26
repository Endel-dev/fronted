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
class OrderWidget {
  //orderDetails decor box
  BoxDecoration deco(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r8)),
      color: appColor(context).appTheme.colorContainer);

  //history page decor box
  BoxDecoration decoBorder() => const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.r4)));

  //history Container Decor
  BoxDecoration decorContainer(context, data) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r4)),
      color: data['deliveryStatus'] == appFonts.onGoing
          ? appColor(context).appTheme.highLight.withOpacity(0.12)
          : appColor(context).appTheme.highLightRed.withOpacity(0.12));
//history page decor
  BoxDecoration decorHistory(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r6)),
      color: appColor(context).appTheme.searchBackground);
}
