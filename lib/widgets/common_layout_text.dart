import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';

import '../config.dart';
import '../routes/index.dart';

class CommonTextLayout extends StatelessWidget {
  final String text;
  final bool isStyle;

  const CommonTextLayout({super.key, required this.text, this.isStyle = false});

  @override
  Widget build(BuildContext context) {
    //text display
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(text,
              style: isStyle == true
                  ? appCss.dmPoppinsMedium14
                      .textColor(appColor(context).appTheme.whiteColor)
                  : appCss.dmPoppinsRegular14.textColor(
                      appColor(context).appTheme.txtTransparentColor)),
        ),
      ],
    );
  }
}
