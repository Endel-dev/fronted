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
import 'common_container.dart';
import 'common_list_header.dart';
import 'details_check_delivery_sublayout.dart';
import 'details_second_layout/details_widget.dart';
class DetailsColorSubLayout extends StatelessWidget {
  final dynamic data;
  const DetailsColorSubLayout({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    //color layout
    return Container(
      alignment: Alignment.center,
      width: Sizes.s20,
      height: Sizes.s20,
      margin: const EdgeInsets.only(right: Insets.i5),
      padding: const EdgeInsets.all(Insets.i4),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: appColor(context).appTheme.whiteColor),
      child: Container(
              alignment: Alignment.center,
              width: Sizes.s15,
              height: Sizes.s15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: data['colorCode']))
    );
  }
}
