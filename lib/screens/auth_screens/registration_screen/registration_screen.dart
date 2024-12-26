import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/screens/auth_screens/registration_screen/textfield_layout.dart';

import '../../../common/assets/index.dart';
import '../../../common/extension/spacing.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../provider/auth_provider/registration_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_auth_richtext.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/direction_page.dart';


class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
        builder: (context1, registration, child) {
          //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.primaryColor,
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Stack(children: [
                Image.asset(imageAssets.background),
                Form(
                  key: registration.registrationKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          //top text layout
                          CommonWidget().commonTextLoginRegistration(context),
                          //registration text layout
                          const TextFieldLayoutRegistration()
                        ]),
                        Column(children: [
                          VSpace(MediaQuery.of(context).size.height * 0.055),
                          //registration click event
                          ButtonCommon(
                              title: language(context, appFonts.signUp),
                              onTap: () =>
                                  registration.onRegistration(context)),
                          const VSpace(Sizes.s30),
                          Image.asset(imageAssets.oR),
                          const VSpace(Sizes.s30),
                          //bottom sign in link layout
                          CommonAuthRichText(
                              text: language(context, appFonts.accountCreate),
                              subtext: language(context, appFonts.signIn),
                              onTap: () => route.pop(context))
                        ]).paddingSymmetric(vertical: Insets.i30)
                      ]).paddingSymmetric(horizontal: Insets.i20),
                )
              ])))));
    });
  }
}
