// import 'package:piggypaisa/common/common_path_list.dart';
// import 'package:piggypaisa/screens/auth_screens/registration_screen/textfield_layout.dart';
//
// import '../../../common/assets/index.dart';
// import '../../../common/extension/spacing.dart';
// import '../../../common/theme/scale.dart';
// import '../../../config.dart';
// import 'package:piggypaisa/plugin_list.dart';
// import 'package:flutter/material.dart';
//
// import '../../../provider/auth_provider/registration_provider.dart';
// import '../../../routes/index.dart';
// import '../../../utils/common_function.dart';
// import '../../../widgets/common_auth_richtext.dart';
// import '../../../widgets/common_button.dart';
// import '../../../widgets/common_widgets.dart';
// import '../../../widgets/direction_page.dart';
//
//
// class RegistrationPage extends StatelessWidget {
//   const RegistrationPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RegistrationProvider>(
//         builder: (context1, registration, child) {
//           //direction layout
//       return Scaffold(
//               backgroundColor: appColor(context).appTheme.primaryColor,
//               appBar: AppBar(),
//               body: SafeArea(
//                       child: Column(
//                           children: [
//
//                 // Image.asset(imageAssets.background),
//                 Form(
//                   key: registration.registrationKey,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(children: [
//                           //top text layout
//                           CommonWidget().commonTextLoginRegistration(context),
//                           //registration text layout
//                           const TextFieldLayoutRegistration()
//                         ]),
//                         Column(children: [
//                           VSpace(MediaQuery.of(context).size.height * 0.055),
//                           //registration click event
//                           ButtonCommon(
//                               title: language(context, appFonts.signUp),
//                               onTap: () =>
//                                   registration.onRegistration(context)),
//                           const VSpace(Sizes.s30),
//                           Image.asset(imageAssets.oR),
//                           const VSpace(Sizes.s30),
//                           //bottom sign in link layout
//                           CommonAuthRichText(
//                               text: language(context, appFonts.accountCreate),
//                               subtext: language(context, appFonts.signIn),
//                               onTap: () => route.pop(context))
//                         ]).paddingSymmetric(vertical: Insets.i30)
//                       ]).paddingSymmetric(horizontal: Insets.i20),
//                 )
//               ])));
//     });
//   }
// }
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/screens/auth_screens/registration_screen/textfield_layout.dart';

import '../../../Backend/APIs.dart';
import '../../../Global_values.dart';
import '../../../common/assets/index.dart';
import '../../../common/extension/spacing.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../provider/auth_provider/registration_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_auth_richtext.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/direction_page.dart';
import 'email_sent_screen.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationPage_state();
  }
}

class RegistrationPage_state extends State<RegistrationPage> {
  // bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
        builder: (context1, registration, child) {
      //direction layout
      return DirectionLayout(
        dChild: Scaffold(
          backgroundColor: appColor(context).appTheme.primaryColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset(imageAssets.background),
                  Form(
                    key: registration.registrationKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            //top text layout
                            CommonWidget()
                                .commonTextLoginRegistration(context, false),
                            //registration text layout
                            const TextFieldLayoutRegistration()
                          ]),
                          Column(children: [
                            // VSpace(MediaQuery.cof(context).size.height * 0.055),
                            //registration click event
                            // ButtonCommon(
                            //     title: language(context, appFonts.signUp),
                            //     onTap: () async {
                            //       if (registration.registrationKey.currentState!
                            //           .validate()) {
                            //
                            //         // setState(() {
                            //         //   isLoading = true; // Set loading state to true
                            //         // });
                            //
                            //
                            //         final taskData = {
                            //           "email":
                            //               "${registration.emailController.text}",
                            //           "password":
                            //               "${registration.passwordController.text}",
                            //           "name":
                            //               "${registration.firstNameController.text}+${registration.lastNameController.text}",
                            //           "dob":
                            //               "${registration.dobController.text}",
                            //           "gender": registration.gender,
                            //           "role": "parent",
                            //           "phoneNumber":
                            //               "${registration.phoneNumberController.text}",
                            //           "address1":
                            //               "${registration.addLine1Controller.text}",
                            //           "address2":
                            //               "${registration.addLin2Controller.text}",
                            //           "address3":
                            //               "${registration.addLin2Controller.text}",
                            //           "city":
                            //               "${registration.cityController.text}",
                            //           "state":
                            //               "${registration.stateController.text}",
                            //           "pinCode":
                            //               "${registration.pincodeController.text}",
                            //           "firstName":
                            //               "${registration.firstNameController.text}",
                            //           "lastName":
                            //               "${registration.lastNameController.text}",
                            //         };
                            //         await sign_up_method(taskData);
                            //
                            //         // setState(() {
                            //         //   isLoading = false; // Set loading state to false after API call
                            //         // });
                            //
                            //         showDialog(
                            //           context: context,
                            //           barrierDismissible: false,
                            //           builder: (BuildContext context) {
                            //             Future.delayed(Duration(seconds: 1),
                            //                 () {
                            //               Navigator.of(context).pop();
                            //               if (sign_up_success == true) {
                            //                 Navigator.of(context).push(
                            //                     MaterialPageRoute(
                            //                         builder: (context) =>
                            //                             EmailSentScreen()));
                            //               } else {
                            //                 Fluttertoast.showToast(
                            //                     msg: "Sign Up Failed",
                            //                     backgroundColor: Colors.red,
                            //                     textColor: Colors.white);
                            //               }
                            //               setState(() {});
                            //             });
                            //             return AlertDialog(
                            //                 backgroundColor: Colors.yellow,
                            //                 title: Container(
                            //                     height: 100,
                            //                     width: 100,
                            //                     child: new Center(
                            //                         child:
                            //                             CircularPercentIndicator(
                            //                       radius: 15.0,
                            //                     ))));
                            //
                            //             // Add your playful GIF here                      height: 100,                    ),                    SizedBox(height: 20),                    Text(                      'Loading, please wait...',                      style: TextStyle(                        fontSize: 18,                        fontWeight: FontWeight.bold,                        color: Colors.blue.shade700,                      ),                    ),                    SizedBox(height: 10),                    CircularProgressIndicator(                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange.shade400),                      strokeWidth: 6,                    ),                  ],                ),              ),          ),      );
                            //           },
                            //         );
                            //       } else {
                            //
                            //         Fluttertoast.showToast(
                            //             msg: "Please fill the required fields",
                            //             backgroundColor: Colors.red,
                            //             textColor: Colors.white);
                            //       }
                            //
                            //       const VSpace(Sizes.s30);
                            //       Image.asset(imageAssets.oR);
                            //       const VSpace(Sizes.s30);
                            //       //bottom sign in link layout
                            //       CommonAuthRichText(
                            //           text: language(
                            //               context, appFonts.accountCreate),
                            //           subtext:
                            //               language(context, appFonts.signIn),
                            //           onTap: () => route.pop(context));
                            //     })

                          ]).paddingSymmetric(vertical: Insets.i30)
                        ]).paddingSymmetric(horizontal: Insets.i20),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
