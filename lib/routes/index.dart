import 'package:piggypaisa/routes/route_method.dart';
import 'package:piggypaisa/routes/route_name.dart';
import 'package:piggypaisa/plugin_list.dart';
import '../../config.dart';
import '../common/session.dart';
import '../provider/theme_provider/theme_service.dart';

RouteName routeName = RouteName();
AppRoute appRoute = AppRoute();
Session session = Session();

ThemeService appColor(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);
  return themeServices;
}
