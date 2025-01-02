import 'package:flutter/material.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/screens/auth_screens/auth_path_list.dart';
import 'package:piggypaisa/widgets/common_button.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';
import '../../../common/assets/index.dart';
import '../../../common/extension/spacing.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import '../../../widgets/direction_page.dart';
import '../../../routes/index.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DirectionLayout(
      dChild: Scaffold(
        backgroundColor: appColor(context).appTheme.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(imageAssets.background),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      // const VSpace(Sizes.s150),

                      VSpace(MediaQuery.of(context).size.height * 0.3), // Adding some space at the top

                      // Information text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                        child: Text(
                          "A confirmation email has been sent to your email address. Please check your inbox.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const VSpace(Sizes.s30),

                      // Continue Button
                      ButtonCommon(
                        title: "Continue",
                        onTap: () {
                          // Navigate to Sign-In screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                      ),
                      const VSpace(Sizes.s30),



                    ],
                  ).paddingSymmetric(horizontal: Sizes.s20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
