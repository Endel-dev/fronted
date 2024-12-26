import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/shipping_screen/layout/shipping_widget.dart';
import '../../../../common/extension/spacing.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/address_provider.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_filter/common_radio.dart';

class AddressTypeSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;
  const AddressTypeSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(builder: (context1, address, child) {
      return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const HSpace(Sizes.s10),
        //radio button
        CommonRadio(
            index: index,
            selectedIndex: address.selectRadio,
            onTap: () => address.selectAddressType(data, index)),
        const HSpace(Sizes.s5),
        Text(language(context, data["title"].toString()),
            overflow: TextOverflow.ellipsis,
            style: appCss.dmPoppinsSemiBold14
                .textColor(isThemeColorReturn(context))),
        const HSpace(Sizes.s15),
        if (data['id'] != 3)
          //divider
          ShippingWidget().divider(context)
      ]).inkWell(onTap: () => address.selectAddressType(data, index));
    });
  }
}
