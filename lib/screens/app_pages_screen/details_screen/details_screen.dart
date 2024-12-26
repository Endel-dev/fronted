import '../../../config.dart';
import '../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../provider/app_pages_provider/details_provider.dart';
import '../../../provider/app_pages_provider/direction_provider.dart';
import '../../../provider/bottom_provider/home_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/direction_page.dart';
import 'layout/details_second_layout/details_second_bottom_layout.dart';
import 'layout/details_sublayout.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<HomeProvider, DetailsProvider, DirectionProvider>(
        builder: (context2, home, details, direction, child) {
          return WillPopScope(
            onWillPop: () async {
              // Handle back button logic here
              return details.detailsPopScope(details);
            },
            child: DirectionLayout(
              dChild: Scaffold(
                backgroundColor: isTheme(context)
                    ? appColor(context).appTheme.backGroundColorMain
                    : null,
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          DetailsSubLayout(),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: DetailsSecondBottomLayout(),
                    ),
                  ],
                ),
              ),
            ),
          );

        });
  }
}
