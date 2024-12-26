import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../common/assets/index.dart';
import '../common/theme/scale.dart';
import '../config.dart';
import '../provider/app_pages_provider/direction_provider.dart';
import '../provider/theme_provider/theme_service.dart';
import '../utils/common_function.dart';
import 'common_widgets.dart';

class CommonAppBar extends StatelessWidget {
  //final String? iconPath;
  final bool isIcon;
  final String appName;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;

  const CommonAppBar(
      {Key? key,
      this.isIcon = false,
      required this.appName,
      this.onPressed,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, DirectionProvider>(
        builder: (context, theme, direction, child) {
      return Stack(children: [
        (isIcon == true)
        //svg icon appbar
            ? IconButton(
                icon: CommonWidget().svgImage(
                    context, svgAssets.iconNextArrow, svgAssets.iconBackArrow),
                onPressed: onPressed,
              )
            : const SizedBox(width: Sizes.s36),
        //title appbar
        Align(
            alignment: Alignment.center,
            child: Text(appName,
                    overflow: TextOverflow.ellipsis,
                    style: appCss.dmPoppinsSemiBold16
                        .textColor(isThemeColorReturn(context)))
                .paddingOnly(top: Insets.i8))
      ]);
    });
  }
}
