import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';

import '../common/theme/scale.dart';
import 'common_widgets.dart';

class CommonAppbarButton extends StatelessWidget {
  final String imagePath; // Path to your image asset
  final VoidCallback onPressed;
  final ColorFilter? color;
  final Color? colorContainer;

  const CommonAppbarButton(
      {super.key,
      required this.imagePath,
      required this.onPressed,
      this.color,
      this.colorContainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            height: Sizes.s40,
            width: Sizes.s40,
            //decoration
            decoration:
                CommonWidget().commonAppbarDecor(context, colorContainer),
            //svg icon
            child: Center(
                child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.scaleDown,
              height: Sizes.s20,
              width: Sizes.s20,
              colorFilter: color,
            )).paddingAll(Insets.i2)));
  }
}
