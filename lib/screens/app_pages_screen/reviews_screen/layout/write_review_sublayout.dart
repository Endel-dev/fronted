import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/reviews_screen/layout/review_widget.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_button.dart';
import '../../../../widgets/common_textfield_address.dart';
import '../../../../widgets/common_widgets.dart';
import '../../shipping_screen/layout/shipping_widget.dart';

class WriteReviewSubLayout extends StatelessWidget {
  const WriteReviewSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Column(children: [
        //text widget
        ShippingWidget()
            .textCommon(language(context, appFonts.reviewTitle), true, context),
        const VSpace(Sizes.s6),
        CommonTextFieldAddress(
            hintText: language(context, appFonts.hintReviewTitle),
            controller: details.reviewController,
            keyboardType: TextInputType.text,
            focusNode: details.reviewFocus,
           /* validator: (value) => Validation().emailValidation(context, value)*/),
        //divider
        CommonWidget()
            .commonDivider(context)
            .paddingSymmetric(vertical: Insets.i15),
        //text widget
        ShippingWidget().textCommon(
            language(context, appFonts.addPhotoVideo), true, context),
        const VSpace(Sizes.s6),
        //dotted border widget
        ReviewWidget().writeReviewBorder(
            context,
            //upload data
            ReviewWidget().iconTextIncrement(context)),
        //divider
        CommonWidget()
            .commonDivider(context)
            .paddingSymmetric(vertical: Insets.i15),
        //text widget
        ShippingWidget()
            .textCommon(language(context, appFonts.reviews), true, context),
        const VSpace(Sizes.s6),
        CommonTextFieldAddress(
            height: MediaQuery.of(context).size.height * 0.12,
            fillColor: appColor(context).appTheme.searchBackground,
            hintText: language(context, appFonts.hintReview),
            controller: details.reviewsController,
            keyboardType: TextInputType.text,
            focusNode: details.reviewsFocus,
            /*validator: (value) => Validation().emailValidation(context, value)*/),
        const VSpace(Sizes.s15),
        ButtonCommon(
            title: language(context, appFonts.submitReview),
            color: isThemeButtonColorReturn(context),
            style: appCss.dmPoppinsRegular16
                .textColor(isThemeColorReturnDark(context)),
            onTap: () => route.pop(context)),
        const VSpace(Sizes.s15)
      ]);
    });
  }
}
