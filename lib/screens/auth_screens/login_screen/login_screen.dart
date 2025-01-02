import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/screens/auth_screens/auth_path_list.dart';
import 'package:piggypaisa/widgets/common_statefulwapper.dart';

import '../../../Backend/APIs.dart';
import '../../../Global_values.dart';
import '../../../common/assets/index.dart';
import '../../../common/extension/spacing.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';

import '../../../provider/auth_provider/login_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_auth_richtext.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/direction_page.dart';
import 'layout/richtext_login_layout.dart';
import 'layout/textfield_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Loginscreen_state();
  }
}

class Loginscreen_state extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context1, login, child) {
      // login.passwordController.text = 'ulkadesai05';
      // login.emailController.text = 'ulka725@gmail.com';
      return StatefulWrapper(
        //load page
        onInit: () => Future.delayed(const Duration(milliseconds: 10))
            .then((_) => login.onReady(context)),
        //direction layout
        child: DirectionLayout(
          dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.primaryColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(children: [
                  Image.asset(imageAssets.background),
                  Form(
                      key: login.loginKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                //login top text layout
                                CommonWidget()
                                    .commonTextLoginRegistration(context,true),
                                //textfield layout
                                const TextFieldLayout(),
                              ],
                            ),

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotScreen()),
                                  );
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    // Customize the text color as needed
                                    fontSize: 14,
                                    // Adjust the font size if needed
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            VSpace(MediaQuery.of(context).size.height * 0.01),

                            ButtonCommon(
                                title: language(context, appFonts.signIn),
                                onTap: () {
                                  if (login.emailController.text == "" ||
                                      login.passwordController.text == "") {
                                    Fluttertoast.showToast(
                                        msg:
                                            "please! Fill the Email and password",
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white);
                                  } else {
                                    sign_in_method(
                                        login.email_v == true
                                            ? login.emailController.text
                                            : login.emailController.text,
                                        login.passwordController.text);
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        new Future.delayed(
                                            new Duration(seconds: 1), () {
                                          Navigator.of(context).pop();
                                          if (sign_in_success == true) {
                                            if (userrole_dispaly == "parent" ||
                                                userrole_dispaly ==
                                                    "guardian") {
                                              login.onLogin(context);
                                              Fluttertoast.showToast(
                                                  msg: "Login Successful",
                                                  backgroundColor: Colors.blue,
                                                  textColor: Colors.white);
                                            }
                                            if (userrole_dispaly == 'child') {
                                              //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChildHomeScreen()));
                                            }
                                          } else {
                                            //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ErrorScreen(errorMessage: "Login Failed! Try Again")));
                                          }
                                          setState(() {});
                                        });
                                        return AlertDialog(
                                          backgroundColor: Colors.blueGrey,
                                          title: Container(
                                            height: 100,
                                            width: 100,
                                            child: new Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }),
                            const VSpace(Sizes.s30),
                            Image.asset(imageAssets.oR),
                            const VSpace(Sizes.s5),
                            //bottom integration button and sign up account link layout
                            const RichTextLayoutLogin()
                          ]).paddingSymmetric(horizontal: Sizes.s20))
                ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
