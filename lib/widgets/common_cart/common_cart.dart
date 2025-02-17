import 'package:piggypaisa/plugin_list.dart';
import '../../common/theme/scale.dart';
import '../../config.dart';
import 'package:flutter/material.dart';

import '../../plugin_list.dart';
import '../../provider/theme_provider/theme_service.dart';
import '../../utils/common_function.dart';

class CommonCart extends StatelessWidget {
  final String imagePath;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onTap;
  const CommonCart(
      {super.key, required this.imagePath, this.margin, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      //cart common button
      return GestureDetector(
          onTap: onTap,
          //Container
          child: Container(
              height: Sizes.s28,
              width: Sizes.s28,
              padding: const EdgeInsets.all(Insets.i6),
              margin: margin,
              decoration: BoxDecoration(
                  color: isThemeColorReturn(context), shape: BoxShape.circle),
              //svg image
              child: SvgPicture.asset(imagePath,
                  colorFilter: ColorFilter.mode(
                      isThemeColorReturnDark(context), BlendMode.srcIn))));
    });
  }
}
