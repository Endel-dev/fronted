import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';

import '../config.dart';
import '../plugin_list.dart';
import '../routes/index.dart';

class CommonAuthRichText extends StatelessWidget {
  final String text;
  final String subtext;
  final GestureTapCallback? onTap;
  const CommonAuthRichText(
      {super.key, required this.text, required this.subtext, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //auth screen in login and registration rich text
        RichText(
            text: TextSpan(
                text: text,
                style: appCss.dmPoppinsMedium12
                    .textColor(appColor(context).appTheme.txtTransparentColor),
                children: [
              TextSpan(
                  text: subtext,
                  style: appCss.dmPoppinsMedium12
                      .textColor(appColor(context).appTheme.whiteColor),
                  recognizer: TapGestureRecognizer()..onTap = onTap)
            ]))
      ],
    );
  }
}
