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
import 'common_app_button.dart';
import 'common_container.dart';
import 'common_list_header.dart';
import 'details_check_delivery_sublayout.dart';
import 'details_second_layout/details_widget.dart';
class DetailSubLayoutOne extends StatelessWidget {
  const DetailSubLayoutOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Stack(children: [
        //appbar and top data list
        SizedBox(
            child: Image.asset(imageAssets.imageBackground,
                fit: BoxFit.scaleDown)),
        Stack(children: [
          IconButton(
              //arrow svg
              icon: SvgPicture.asset(
                isDirectionRTL(context) || isAr(context)
                    ? svgAssets.iconNextArrow
                    : svgAssets.iconBackArrow,
                colorFilter: ColorFilter.mode(
                    appColor(context).appTheme.whiteColor, BlendMode.srcIn),
              ),
              onPressed: () => route.pop(context)),
          //appbar name text
          Align(
            alignment: Alignment.center,
            child: Text(language(context, appFonts.chair),
                style: appCss.dmPoppinsSemiBold16
                    .textColor(appColor(context).appTheme.whiteColor)),
          ).paddingOnly(top: Insets.i10),
//wishlist button layout and align set on appbar
          CommonWidget().topAlign(
            context,
            CommonAppbarButtonDetails(
                colorSvg: details.isWishlist
                    ? appColor(context).appTheme.linkErrorColor
                    : appColor(context).appTheme.whiteColor,
                imagePath: details.isWishlist
                    ? svgAssets.iconWishlistOne
                    : svgAssets.iconWishlist,
                onTap: () => details.onWishlistIn()),
          ),
          //search button layout and align set on appbar
          CommonWidget()
              .topAlign(
                context,
                CommonAppbarButtonDetails(
                    imagePath: svgAssets.iconSearchFill,
                    onTap: () => route.pushNamed(context, routeName.chairData)),
              )
              .paddingSymmetric(horizontal: Insets.i50),
        ]).paddingOnly(
            top: Insets.i45,
            left: Insets.i20,
            right: Insets.i20,
            bottom: Insets.i25)
      ]);
    });
  }
}
