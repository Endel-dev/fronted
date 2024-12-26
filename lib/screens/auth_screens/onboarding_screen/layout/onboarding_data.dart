import 'package:piggypaisa/common/theme/scale.dart';

import '../../../../common/assets/index.dart';
import '../../../../common/extension/spacing.dart';
import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/auth_provider/onboarding_provider.dart';
import 'onboarding_subdata.dart';
import 'onboarding_widget.dart';

class OnBoardingData extends StatelessWidget {
  final int? index;
  final dynamic data;
  const OnBoardingData({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context1, rotation, child) {
      return Column(children: [
        const VSpace(Sizes.s5),
        //Logo set
        SizedBox(
            height: Sizes.s37,
            width: Sizes.s80,
            child: Image.asset(imageAssets.onBoardingLogo)),
        const VSpace(Sizes.s10),
        Stack(children: [
          //OnBoarding Background cricle image
          OnBoardingWidget().image(imageAssets.onBoardingScreen),
          //round animated cricle position set
          if (rotation.controller != null)
            OnBoardingWidget().circlePosition(context, rotation.controller!),
          Column(children: [
            //Center image set size all diffrent size set
            Center(
                child: SizedBox(
                    height: index == 0
                        ? MediaQuery.of(context).size.height * 0.53
                        : index == 1
                            ? MediaQuery.of(context).size.height * 0.47
                            : index == 2
                                ? MediaQuery.of(context).size.height * 0.38
                                : MediaQuery.of(context).size.height * 0.55,
                    width: index == 0
                        ? MediaQuery.of(context).size.width * 0.70
                        : index == 1
                            ? MediaQuery.of(context).size.width * 0.85
                            : index == 2
                                ? MediaQuery.of(context).size.width * 0.60
                                : MediaQuery.of(context).size.width * 0.68,
                    child: Image.asset(data['image'])))
          ])
        ]),
        Expanded(
            flex: 3,
            //bottom subLayout
            child: OnBoardingSubData(
              index: index,
              data: data,
            ))
      ]);
    });
  }
}
