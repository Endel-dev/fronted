import '../../../../config.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';

import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../provider/bottom_provider/cart_provider.dart';

import 'package:flutter/material.dart';

import '../../../../utils/common_function.dart';
import '../../../../widgets/common_steper_button.dart';
import 'cart_subtext_layout.dart';
import 'cart_widget.dart';
class CartWidget {
  //image container decoration
  BoxDecoration decor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r8)),
      color: appColor(context).appTheme.colorContainer);

//color decoration
  BoxDecoration colorDecor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r13)),
      color: appColor(context).appTheme.colorText);

//button decor
  BoxDecoration buttonDecor(context) =>
      BoxDecoration(color: isThemeColorReturnDark(context), boxShadow: [
        BoxShadow(
            color: appColor(context).appTheme.shadowColorTwo,
            spreadRadius: 2,
            blurRadius: 8)
      ]);
}
