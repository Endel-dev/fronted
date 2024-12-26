import 'package:piggypaisa/config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';
import 'package:piggypaisa/widgets/common_statefulwapper.dart';

import '../../../provider/auth_provider/onboarding_provider.dart';
import '../../../routes/index.dart';
import 'layout/onboarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context1, onBoarding, child) {
      //Circle rotation
      return StatefulWrapper(
          onInit: () => Future.delayed(
                const Duration(milliseconds: 10),
                () => onBoarding.onRotateCircle(this, context),
              ),
          onDispose: () => onBoarding.onDispose(),
          child: Scaffold(
              backgroundColor: appColor(context).appTheme.primaryColor,
              body: SafeArea(
                child: Stack(children: [
                  //Page slide
                  PageView.builder(
                      itemCount: appArray.onBoardingList.length,
                      controller: onBoarding.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        //SubLayout onBoarding
                        return OnBoardingData(
                          index: index,
                          data: appArray.onBoardingList[index],
                        );
                      })
                ]),
              )));
    });
  }
}
