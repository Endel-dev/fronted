import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';
import 'package:piggypaisa/widgets/common_textfield_address.dart';

import '../../../../provider/app_pages_provider/payment_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../../widgets/common_button.dart';
import '../../../../widgets/direction_page.dart';
import '../../shipping_screen/layout/shipping_widget.dart';
import 'add_card_sublayout.dart';

class AddCardLayout extends StatelessWidget {
  const AddCardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PaymentProvider, ThemeService>(
        builder: (context, payment, theme, child) {
          //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Form(
                          key: payment.addCardKey,
                          child: Column(children: [
                            //appbar for add card layout
                            CommonAppBar(
                                appName: language(context, appFonts.addCard),
                                isIcon: true,
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.20),
                                onPressed: () =>
                                    route.pop(context)).paddingOnly(
                                top: Insets.i10, bottom: Insets.i20),
                            //common text widget
                            ShippingWidget().textCommon(language(context, appFonts.cardNumber), false, context),
                            const VSpace(Sizes.s6),
                            CommonTextFieldAddress(
                                hintText:
                                    language(context, appFonts.hintCardNumber),
                                controller: payment.cardNumberController,
                                keyboardType: TextInputType.text,
                                focusNode: payment.cardNumberFocus,
                                /*validator: (value) => Validation()
                                    .nameValidation(context, value)*/),
                            const VSpace(Sizes.s15),
                            //common text widget
                            ShippingWidget().textCommon(language(context, appFonts.holderName), false, context),
                            const VSpace(Sizes.s6),
                            CommonTextFieldAddress(
                                hintText:
                                    language(context, appFonts.hintHolderName),
                                controller: payment.cardHolderNameController,
                                keyboardType: TextInputType.text,
                                focusNode: payment.cardHolderNameFocus,
                                /*validator: (value) => Validation()
                                    .nameValidation(context, value)*/),
                            const VSpace(Sizes.s15),
                            //add card sub layout
                            const AddCardSubLayout(),
                            const VSpace(Sizes.s25),
                            ButtonCommon(
                                title:
                                    language(context, appFonts.addCardDetails),
                                color: isThemeButtonColorReturn(context),
                                style: appCss.dmPoppinsRegular16
                                    .textColor(isThemeColorReturnDark(context)),
                                radius: AppRadius.r10,
                                onTap: () => route.pop(context))
                          ]).paddingSymmetric(horizontal: Insets.i20))))));
    });
  }
}
