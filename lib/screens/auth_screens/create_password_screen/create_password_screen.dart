import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/provider/auth_provider/create_password_provider.dart';
import 'package:piggypaisa/screens/auth_screens/create_password_screen/textfield_data.dart';

import '../../../common/assets/index.dart';
import '../../../common/extension/spacing.dart';
import '../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_statefulwapper.dart';
import '../../../widgets/direction_page.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreatePasswordProvider>(
        builder: (context1, changepassword, child) {
      return DirectionLayout(
          dChild: StatefulWrapper(
        onInit: () => Future.delayed(const Duration(milliseconds: 10))
            .then((_) => changepassword.onReady(context)),
        child: Scaffold(
            backgroundColor: appColor(context).appTheme.primaryColor,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Form(
                        key: changepassword.changePasswordKey,
                        child: Stack(children: [
                          Image.asset(imageAssets.background),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                VSpace(
                                    MediaQuery.of(context).size.height * 0.23),
                                Text(
                                    language(
                                        context, appFonts.createNewPassword),
                                    style: appCss.dmPoppinsSemiBold22.textColor(
                                        appColor(context).appTheme.whiteColor)),
                                const VSpace(Sizes.s30),
                                //password text field
                                const CreatePasswordTextField(),
                                const VSpace(Sizes.s45),
                                //changepassword button click event
                                ButtonCommon(
                                    title: language(
                                        context, appFonts.resetPassword),
                                    onTap: () => changepassword
                                        .onChangePassword(context)),
                              ]).paddingSymmetric(horizontal: Insets.i20)
                        ]))))),
      ));
    });
  }
}
