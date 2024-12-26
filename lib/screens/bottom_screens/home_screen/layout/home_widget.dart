import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';

import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../provider/bottom_provider/cart_provider.dart';

import 'package:flutter/material.dart';

import '../../../../provider/bottom_provider/dashboard_provider.dart';
import '../../../../provider/bottom_provider/home_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_appbar_button.dart';
import '../../../../widgets/common_cart/common_cart_button.dart';
import '../../../../widgets/common_container_grid.dart';
import '../../../../widgets/common_steper_button.dart';
import '../../../../widgets/common_wishlist_button.dart';
import '../../../../widgets/direction_page.dart';
import 'common_banner_layout.dart';
import 'common_grid_layout.dart';
import 'furniture_list_sublayout.dart';
import 'home_widget.dart';

class HomeWidget {
  //decoration image profile
  BoxDecoration decor(image) => BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover));

//banner layout set
  Widget banner(context, image) => Directionality(
      textDirection: TextDirection.ltr,
      child: CommonBannerLayout(
          imagePath: image, //,
          onPressed: () => route.pushNamed(context, routeName.chairData)));

//square banner in bottom home screen
  Row bannerSquare(context) => Row(children: [
        CommonGridLayout(
            imagePath: imageAssets.imageGrid,
            onPressed: () => route.pushNamed(context, routeName.chairData)),
        //grid layout
        CommonGridLayout(
            imagePath: imageAssets.imageGridOne,
            onPressed: () => route.pushNamed(context, routeName.chairData))
      ]);

//furniture list icon set
  SvgPicture iconFurniture(context, data, home, index) =>
      SvgPicture.asset(data['image'].toString(),
          colorFilter: ColorFilter.mode(
              isTheme(context)
                  ? home == index
                      ? appColor(context).appTheme.primaryColor
                      : appColor(context).appTheme.txtTransparentColor
                  : home == index
                      ? appColor(context).appTheme.whiteColor
                      : appColor(context).appTheme.primaryColor,
              BlendMode.srcIn),
          fit: BoxFit.scaleDown);

//trend furniture decoration
  BoxDecoration trendFurnitureDecor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r6)),
      color: isTheme(context)
          ? appColor(context).appTheme.primaryColor
          : appColor(context).appTheme.searchBackground);

//trend furniture image decoration
  BoxDecoration trendFurnitureImageDecor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r8)),
      color: appColor(context).appTheme.colorContainer);

//align set
  Align align(context, widget) => Align(
      alignment: isDirectionRTL(context) || isAr(context)
          ? Alignment.topRight
          : Alignment.topLeft,
      child: widget);

//offer zone decoration
  BoxDecoration decorOfferZone(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r6)),
      color: isTheme(context)
          ? appColor(context).appTheme.backGroundColorMain
          : appColor(context).appTheme.whiteColor);

//offer zone image container decoration
  BoxDecoration offerZoneDecor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r6)),
      color: isTheme(context)
          ? appColor(context).appTheme.colorContainer
          : appColor(context).appTheme.searchBackground);

  //list top main name
  Row listNameCommon(context, listName) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(listName,
            style: appCss.dmPoppinsSemiBold16
                .textColor(isThemeColorReturn(context))),
        Text(language(context, appFonts.viewAll),
                style: appCss.dmPoppinsMedium12
                    .textColor(appColor(context).appTheme.lightText))
            .inkWell(onTap: () => route.pushNamed(context, routeName.chairData))
      ]);

//furniture list decoration
  BoxDecoration furnitureListDecor(context, selectIndex, index) =>
      BoxDecoration(
          color: isTheme(context)
              ? selectIndex == index
                  ? appColor(context).appTheme.whiteColor
                  : appColor(context).appTheme.primaryColor
              : selectIndex == index
                  ? appColor(context).appTheme.primaryColor
                  : appColor(context).appTheme.searchBackground,
          border: Border.all(
              color: appColor(context).appTheme.lightText.withOpacity(0.25),
              width: Sizes.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r6)));
}
