import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';

import 'package:piggypaisa/common/common_path_list.dart';
import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import 'package:flutter/material.dart';
import '../../../../provider/auth_provider/login_provider.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_layout_text.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../../widgets/text_field_common.dart';

class TextFieldLayout extends StatefulWidget {
  const TextFieldLayout({super.key});

  @override
  State<StatefulWidget> createState() {
    return TextFieldLayout_state();
  }


}
class TextFieldLayout_state extends State<TextFieldLayout>
{
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context1, login, child) {
      return Stack(children: [
        Column(children: [
          //text layout
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'I am a:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              ChoiceChip(
                label: Text('Child'),
                selected: login.role == 'Child',
                onSelected: (selected) {
                  setState(() {
                    login.role = 'Child';
                  });
                  login.email_v = false;
                  login.usernaem =true;

                },
                selectedColor: Colors.yellow,
              ),
              SizedBox(width: 10),
              ChoiceChip(
                label: Text('Parent'),
                selected: login.role == 'Parent',
                onSelected: (selected) {
                  setState(() {
                    login.role = 'Parent';
                  });
                  login.email_v = true;
                  login.usernaem = false;

                },
                selectedColor: Colors.yellow,
              ),
            ],
          ),
          CommonTextLayout(
              text: language(context, appFonts.email), isStyle: true),
          const VSpace(Sizes.s6),

          //text filed
          TextFieldCommon(
            keyboardType: TextInputType.emailAddress,
            focusNode: login.emailFocus,
            controller: login.emailController,
            hintText: language(context, appFonts.hintEmail),
            prefixIcon:
            SvgPicture.asset(svgAssets.iconEmail, fit: BoxFit.scaleDown),
            /*validator: (value) =>
                  Validation().emailValidation(context, value)*/),
          const VSpace(Sizes.s15),
          //text layout
          CommonTextLayout(
              text: language(context, appFonts.password), isStyle: true),
          const VSpace(Sizes.s6),
          //text filed
          TextFieldCommon(
            controller: login.passwordController,
            keyboardType: TextInputType.text,
            focusNode: login.passwordFocus,
            hintText: language(context, appFonts.hintPassword),
            obscureText: login.isNewPassword,
            prefixIcon:
            SvgPicture.asset(svgAssets.iconLock, fit: BoxFit.scaleDown),
            suffixIcon: CommonWidget()
                .passwordSVG(login.isNewPassword, svgAssets.iconHide,
                svgAssets.iconEye)
                .inkWell(onTap: () => login.newPasswordSeenTap()),
            /*validator: (value) => validation.passValidation(context, value)*/),
          const VSpace(Sizes.s15),
          //forgot link and remember me layout
          // const ForgotLayout()
        ])
      ]);
    });
  }
}
