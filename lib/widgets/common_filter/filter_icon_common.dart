import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';

import '../../common/assets/index.dart';
import '../../common/theme/scale.dart';
import '../../config.dart';
import 'package:piggypaisa/plugin_list.dart';

import '../../provider/theme_provider/theme_service.dart';
import '../../routes/index.dart';
import '../../utils/common_function.dart';

class FilterIconCommon extends StatelessWidget {
  final VoidCallback onPressed;
  final double? radius;

  const FilterIconCommon({
    super.key,
    required this.onPressed,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      //common icon layout
      return GestureDetector(
          onTap: onPressed,
          child: Container(
              height: Sizes.s48,
              width: Sizes.s48,
              decoration: BoxDecoration(
                color: appColor(context).appTheme.searchBackground,
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? AppRadius.r6)),
              ),
              child: Center(
                  child: SvgPicture.asset(
                svgAssets.iconFilter,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                    isThemeColorReturn(context), BlendMode.srcIn),
                height: Sizes.s20,
                width: Sizes.s20,
              )).paddingAll(Insets.i2)));
    });
  }
}
