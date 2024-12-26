import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
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
import '../../../../provider/auth_provider/login_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';
import 'login_widget.dart';

class LoginWidget {
  //social login decor
  Container socialLogin(context, imagePath) => Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            color: appColor(context).appTheme.txtColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppRadius.r6),
            )),
        child: Center(
            child: SvgPicture.asset(
          imagePath,
          width: Sizes.s34,
          height: Sizes.s34,
          fit: BoxFit.contain,
        ).paddingSymmetric(vertical: Insets.i15)),
      );

  BoxDecoration decor(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(Sizes.s6),
      color: appColor(context).appTheme.txtColor);
}
