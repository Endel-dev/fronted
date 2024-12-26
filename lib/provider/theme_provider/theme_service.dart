import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';

import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../provider/bottom_provider/cart_provider.dart';

import 'package:flutter/material.dart';

import '../../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../../provider/bottom_provider/home_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_appbar_button.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_steper_button.dart';
import '../../../../widgets/common_wishlist_button.dart';
import '../../../../widgets/direction_page.dart';


class ThemeService extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  bool isMode = false; //
  ThemeService(this.sharedPreferences);

  bool get isDarkMode => sharedPreferences.getBool(session.isDarkMode) ?? false;
  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    sharedPreferences.setBool(session.isDarkMode, isDarkMode ? false : true);
    notifyListeners();
  }

  /// Switch theme and save to local storage
  AppTheme get appTheme => isDarkMode
      ? AppTheme.fromType(ThemeType.dark)
      : AppTheme.fromType(ThemeType.light);

  btnMode() {
    isMode = !isMode;
    sharedPreferences.setBool(session.isDarkMode, isMode);
    notifyListeners();
  }

  bool get getMode => sharedPreferences.getBool(session.isDarkMode) ?? false;
}
