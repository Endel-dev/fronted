import '../../../config.dart';
import '../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../provider/bottom_provider/home_provider.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_statefulwapper.dart';
import '../../../widgets/direction_page.dart';
import '../home_screen/layout/common_navigation_drawer.dart';
import 'layout/dashoard_tab_controller_layout.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Consumer2<DashboardProvider, HomeProvider>(
        builder: (context1, dashboard, home, child) {
      return StatefulWrapper(
        //page load
        onInit: () => Future.delayed(const Duration(milliseconds: 50),
            () => dashboard.initTabController(this, context)),
        //device back press
            child: DirectionLayout(
                dChild: Scaffold(
                    key: dashboard.scaffoldKey,
                    //navigation layout
                    drawer: const CommonNavigationDrawer(),
                    backgroundColor: isThemeColorReturnDark(context),
                    body: SafeArea(
                        child: dashboard.tabController != null
                            ? TabBarView(
                                controller: dashboard.tabController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: dashboard.pages)
                            : const CircularProgressIndicator()),
                    bottomNavigationBar: Material(
                        color: isThemeColorReturnDark(context),
                        //dashboard tab layout
                        child: const DashboardTabLayout()))),
      );
    });
  }
}
