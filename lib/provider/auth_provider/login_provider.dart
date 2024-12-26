import 'package:piggypaisa/config.dart';
import '../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../routes/index.dart';
import '../../screens/bottom_screens/dashboard/dashboard_screen.dart';
import '../bottom_provider/dashboard_provider.dart';

class LoginProvider with ChangeNotifier {
  bool usernaem = false;
  bool email_v = true;
  String role = 'Parent';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  bool isNewPassword = true;
  bool checkedValue = false, isBack = false;

//login button
  onLogin(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (loginKey.currentState!.validate()) {
      login(context);
    }
  }

//page load
  onReady(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

  //login
  login(context) {
    if (isBack) {
      route.pop(context);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MultiProvider(providers: [
                    ChangeNotifierProvider(create: (_) => DashboardProvider()),
                  ], child: const Dashboard())),
          ModalRoute.withName(routeName.dashboard));
    }

    notifyListeners();
    onBack();
  }

//onBack clear
  onBack() {
    emailController.text = "";
    passwordController.text = "";
    notifyListeners();
  }

  //new password see tap
  newPasswordSeenTap() {
    isNewPassword = !isNewPassword;
    notifyListeners();
  }

  //remember me
  bool isCheck() {
    checkedValue = !checkedValue;
    notifyListeners();
    return checkedValue;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
