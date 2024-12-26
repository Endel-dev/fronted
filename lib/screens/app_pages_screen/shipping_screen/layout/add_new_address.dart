import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:piggypaisa/screens/app_pages_screen/shipping_screen/layout/add_address_button_sublayout.dart';

import '../../../../config.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/address_provider.dart';
import '../../../../routes/index.dart';
import '../../../../widgets/direction_page.dart';
import 'add_address_sublayout.dart';
import 'address_text_layout.dart';
import 'address_type_layout.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(builder: (context, address, child) {
      //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    SingleChildScrollView(
                        child: Form(
                            key: address.addressKey,
                            child:  Stack(children: [
                              Column(children: [
                                //address sub layout
                                AddressTextLayout(),
                                VSpace(Sizes.s15),
                                //add address sub layout
                                AddAddressSubLayout(),
                                //address type layout
                                AddressTypeLayout()
                              ])
                            ]))).paddingSymmetric(horizontal: Insets.i20),
                    //add address bottom button layout
                    const AddAddressButtonSubLayout()
                  ]))));
    });
  }
}
