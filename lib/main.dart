

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piggypaisa/config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/provider/app_pages_provider/currency_provider.dart';
import 'package:piggypaisa/provider/app_pages_provider/details_provider.dart';
import 'package:piggypaisa/provider/app_pages_provider/direction_provider.dart';
import 'package:piggypaisa/provider/app_pages_provider/filter_provider.dart';
import 'package:piggypaisa/provider/app_pages_provider/help_provider.dart';
import 'package:piggypaisa/provider/app_pages_provider/notification_provider.dart';
import 'package:piggypaisa/provider/app_pages_provider/pagelist_provider.dart';
import 'package:piggypaisa/provider/app_pages_provider/payment_provider.dart';
import 'package:piggypaisa/provider/app_pages_provider/shipping_provider.dart';
import 'package:piggypaisa/provider/auth_provider/create_password_provider.dart';
import 'package:piggypaisa/provider/auth_provider/login_provider.dart';
import 'package:piggypaisa/provider/auth_provider/onboarding_provider.dart';
import 'package:piggypaisa/provider/auth_provider/registration_provider.dart';
import 'package:piggypaisa/provider/auth_provider/splash_provider.dart';
import 'package:piggypaisa/provider/bottom_provider/category_provider.dart';
import 'package:piggypaisa/provider/bottom_provider/dashboard_provider.dart';
import 'package:piggypaisa/provider/bottom_provider/home_provider.dart';
import 'package:piggypaisa/provider/bottom_provider/profile_provider.dart';
import 'package:piggypaisa/provider/bottom_provider/wishlist_provider.dart';
import 'package:piggypaisa/provider/theme_provider/theme_service.dart';
import 'package:piggypaisa/routes/index.dart';
import 'package:piggypaisa/screens/sp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/theme/app_theme.dart';
import 'languages/app_language.dart';
import 'languages/language_change.dart';
import 'provider/app_pages_provider/address_provider.dart';
import 'provider/auth_provider/forgot_provider.dart';
import 'provider/auth_provider/verifyotp_provider.dart';
import 'provider/bottom_provider/cart_provider.dart';

void main() {
  // WidgetsFlutterBinding.();
  runApp(const MyApp());
}

class WidgetsFlutterBinding {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    lockScreenPortrait();
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context2, AsyncSnapshot<SharedPreferences> snapData) {
          if (snapData.hasData) {
            return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (_) => ThemeService(snapData.data!)),
                  ChangeNotifierProvider(
                      create: (_) => LanguageProvider(snapData.data!)),
                  ChangeNotifierProvider(
                      create: (_) => DirectionProvider(snapData.data!)),
                  // ChangeNotifierProvider(create: (_) => SplashProvider()),
                  ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
                  ChangeNotifierProvider(create: (_) => LoginProvider()),
                  ChangeNotifierProvider(create: (_) => RegistrationProvider()),
                  ChangeNotifierProvider(create: (_) => ForgotProvider()),
                  ChangeNotifierProvider(create: (_) => VerifyOtpProvider()),
                  ChangeNotifierProvider(
                      create: (_) => CreatePasswordProvider()),
                  ChangeNotifierProvider(create: (_) => HomeProvider()),
                  ChangeNotifierProvider(create: (_) => DashboardProvider()),
                  ChangeNotifierProvider(create: (_) => CategoryProvider()),
                  ChangeNotifierProvider(create: (_) => CartProvider()),
                  ChangeNotifierProvider(create: (_) => WishlistProvider()),
                  ChangeNotifierProvider(create: (_) => FilterProvider()),
                  ChangeNotifierProvider(create: (_) => PaymentProvider()),
                  ChangeNotifierProvider(create: (_) => ShippingProvider()),
                  ChangeNotifierProvider(create: (_) => AddressProvider()),
                  ChangeNotifierProvider(create: (_) => ProfileProvider()),
                  ChangeNotifierProvider(create: (_) => PageListProvider()),
                  ChangeNotifierProvider(create: (_) => DetailsProvider()),
                  ChangeNotifierProvider(
                      create: (_) => CurrencyProvider(snapData.data!)),
                  ChangeNotifierProvider(create: (_) => HelpProvider()),
                  ChangeNotifierProvider(
                      create: (_) => NotificationProvider(snapData.data!))
                ],
                child:
                Consumer3<ThemeService, LanguageProvider, CurrencyProvider>(
                    builder: (context1, theme, lang, currency, child) {
                      return MaterialApp(
                          title: appFonts.appName,
                          debugShowCheckedModeBanner: false,
                          theme: AppTheme.fromType(ThemeType.light).themeData,
                          darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                          locale: lang.locale,
                          localizationsDelegates: const [
                            AppLocalizations.delegate,
                            AppLocalizationDelagate(),
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate
                          ],
                          supportedLocales: appArray.localList,
                          themeMode: theme.theme,
                          initialRoute: "/LoginScreen",
                          routes: appRoute.route);
                    }));
          } else {
            return MaterialApp(
                theme: AppTheme.fromType(ThemeType.light).themeData,
                darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: const SpPage());
          }
        });
  }
  lockScreenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
