 import '../../../../config.dart';
import '../../../../plugin_list.dart';
 import 'package:piggypaisa/common/common_path_list.dart';

 import '../../../../common/extension/spacing.dart';
 import '../../../../config.dart';
 import '../../../../plugin_list.dart';
 import '../../../../common/theme/scale.dart';
 import '../../../../config.dart';
 import 'package:piggypaisa/plugin_list.dart';
 import 'package:flutter/material.dart';

 import '../../../../provider/app_pages_provider/details_provider.dart';
 import '../../../../provider/app_pages_provider/direction_provider.dart';
 import '../../../../provider/theme_provider/theme_service.dart';
 import '../../../../routes/index.dart';
 import '../../../../utils/common_function.dart';
 import '../../../../widgets/common_widgets.dart';
 import 'common_container.dart';
 import 'common_list_header.dart';
 import 'details_check_delivery_sublayout.dart';
 import 'details_second_layout/details_widget.dart';
class RatingSlider extends StatelessWidget {
  const RatingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<DetailsProvider, ThemeService>(
        builder: (context1, details, theme, child) {
      double clampedValue = details.currentValue.clamp(25.0, 100.0);
      //slider image in bottom layout progress indicator
      return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.006,
          child: ClipRRect(
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppRadius.r10)),
              child: LinearProgressIndicator(
                  value: clampedValue / 100, // Adjusted the value here
                  valueColor: AlwaysStoppedAnimation<Color>(
                      appColor(context).appTheme.primaryColor),
                  backgroundColor: appColor(context).appTheme.whiteColor)));
    });
  }
}
