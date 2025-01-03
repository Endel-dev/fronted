import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:vibration/vibration.dart';

import '../../../Backend/APIs.dart';
import '../../../Global_values.dart';
import '../../../common/assets/index.dart';
import '../../../common/extension/spacing.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../helper/validation.dart';
import '../../../provider/auth_provider/registration_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_auth_richtext.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_layout_text.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/text_field_common.dart';
import 'email_sent_screen.dart';

class TextFieldLayoutRegistration extends StatefulWidget {
  const TextFieldLayoutRegistration({super.key});

  @override
  State<StatefulWidget> createState() {
    return TextFieldLayoutRegistration_state();
  }
}

class TextFieldLayoutRegistration_state
    extends State<TextFieldLayoutRegistration> {
  bool Sign_upo = false;
  GlobalKey<FormState> registrationKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> registrationKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> registrationKey3 = GlobalKey<FormState>();
  PageController _pageController = PageController();
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
        builder: (context1, registration, child) {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      // Page 1: Personal Details (First Name, Last Name, Phone, DOB, Gender)
                      Form(
                        key: registrationKey1,
                        child: Column(
                          children: [
                            // First Name
                            CommonTextLayout(
                              text: language(context, "First Name"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),
                            TextFieldCommon(
                              focusNode: registration.firstNameFocus,
                              controller: registration.firstNameController,
                              keyboardType: TextInputType.text,
                              hintText:
                                  language(context, "Enter your first name"),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]')),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  registration.firstNameFocus.requestFocus();
                                  Vibration.vibrate();
                                  return "First name is required";
                                } else if (value.trim().isEmpty) {
                                  return "First name cannot be empty or just spaces";
                                }
                                return null;
                              },
                            ),
                            const VSpace(Sizes.s15),
                            // Last Name
                            CommonTextLayout(
                              text: language(context, "Last Name"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),
                            TextFieldCommon(
                              focusNode: registration.lastNameFocus,
                              controller: registration.lastNameController,
                              keyboardType: TextInputType.text,
                              hintText:
                                  language(context, "Enter your last name"),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]')),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  registration.lastNameFocus.requestFocus();
                                  Vibration.vibrate();
                                  return "Last name is required";
                                } else if (value.trim().isEmpty) {
                                  return "Last name cannot be empty or just spaces";
                                }
                                return null;
                              },
                            ),
                            const VSpace(Sizes.s15),
                            // Phone Number
                            CommonTextLayout(
                              text: language(context, "Phone Number"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),
                            TextFieldCommon(
                              controller: registration.phoneNumberController,
                              keyboardType: TextInputType.number,
                              focusNode: registration.phoneNumberFocus,
                              hintText:
                                  language(context, "Enter your phone number"),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(10),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  registration.lastNameFocus.requestFocus();
                                  Vibration.vibrate();
                                  return "Phone number is required";
                                } else if (value.trim().isEmpty) {
                                  return "Phone number cannot be empty or just spaces";
                                } else if (value.length != 10) {
                                  return "Phone number must be exactly 10 digits";
                                }
                                return null;
                              },
                            ),
                            const VSpace(Sizes.s15),
                            // Date of Birth
                            CommonTextLayout(
                              text: language(context, "Date of Birth"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),
                            TextFieldCommon(
                              controller: registration.dobController,
                              keyboardType: TextInputType.text,
                              focusNode: registration.dobFocus,
                              hintText: language(
                                  context, "Select your Date of Birth"),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );

                                if (pickedDate != null) {
                                  String formattedDate =
                                      "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                                  registration.dobController.text =
                                      formattedDate;

                                  // Check if the user is 18 or older
                                  if (_isUserUnderage(pickedDate)) {
                                    Vibration.vibrate();
                                    registration.dobController.text = '';
                                    Fluttertoast.showToast(
                                      msg:
                                          "You must be 18 years or older to register.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                    );
                                  }
                                }
                              },
                            ),
                            const VSpace(Sizes.s15),
                            // Gender Selection
                            Row(
                              children: [
                                Text('Gender:',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                SizedBox(width: 10),
                                ChoiceChip(
                                  label: Text('Male'),
                                  selected: registration.gender == 'Male',
                                  onSelected: (selected) {
                                    setState(() {
                                      registration.gender = 'Male';
                                    });
                                  },
                                  selectedColor: Colors.yellow,
                                ),
                                SizedBox(width: 10),
                                ChoiceChip(
                                  label: Text('Female'),
                                  selected: registration.gender == 'Female',
                                  onSelected: (selected) {
                                    setState(() {
                                      registration.gender = 'Female';
                                    });
                                  },
                                  selectedColor: Colors.yellow,
                                ),
                              ],
                            ),
                            VSpace(Sizes.s26),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (registrationKey1.currentState!
                                            .validate() &&
                                        registration.dobController.text != "") {
                                      if (_pageController.page! < 2) {
                                        _pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut);
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please! Enter all details",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white);
                                    }
                                  },
                                  child: Text("Next"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Page 2: Account Details (Email, Password, Confirm Password)
                      Form(
                        key: registrationKey2,
                        child: Column(
                          children: [
                            // Email
                            CommonTextLayout(
                              text: language(context, "Email"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),
                            TextFieldCommon(
                              controller: registration.emailController,
                              keyboardType: TextInputType.emailAddress,
                              focusNode: registration.emailFocus,
                              hintText:
                                  language(context, "Enter your email address"),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  registration.emailFocus.requestFocus();
                                  Vibration.vibrate();
                                  return "Email address is required";
                                }

                                RegExp emailRegExp = RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                                );

                                if (!emailRegExp.hasMatch(value)) {
                                  registration.emailFocus.requestFocus();
                                  Vibration.vibrate();
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                            ),
                            const VSpace(Sizes.s15),
                            // Password
                            CommonTextLayout(
                              text: language(context, "Password"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),

                            TextFieldCommon(
                              controller: registration.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              focusNode: registration.passwordFocus,
                              hintText: language(context, "Enter your password"),
                              obscureText: true,
                              onChanged: (value) {
                                validatePassword(value); // Dynamically validate on change
                              },

                            ),

                            const VSpace(Sizes.s15),


                            if (validationMessages.isNotEmpty)
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(vertical: 8.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(8.0),
                                  // color: Colors.red.shade50,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: validationMessages.map((message) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 4.0),
                                      child: Text(
                                        message,
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            const VSpace(Sizes.s15),


                            // Confirm Password
                            CommonTextLayout(
                              text: language(context, "Confirm Password"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),


                            TextFieldCommon(
                              controller: registration.confPassController,
                              keyboardType: TextInputType.visiblePassword,
                              focusNode: registration.confPassFocus,
                              hintText:
                                  language(context, "Enter confirm password"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  registration.confPassFocus.requestFocus();
                                  Vibration.vibrate();
                                  return "Confirm password is required";
                                } else if (value !=
                                    registration.passwordController.text) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),
                            VSpace(Sizes.s15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_pageController.page! > 0) {
                                      _pageController.previousPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    }
                                  },
                                  child: Text("Previous"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (registrationKey2.currentState!
                                        .validate() &&
                                    validatePassword(registration.passwordController.text)) {
                                      if (_pageController.page! < 2) {
                                        _pageController.nextPage(
                                            duration: Duration(milliseconds: 300),
                                            curve: Curves.easeInOut);
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please! Enter all details",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white);
                                    }
                                  },
                                  child: Text("Next"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Page 3: Address Details (Address Line 1, Line 2, City, State, Pincode)
                      Form(
                        key: registrationKey3,
                        child: Column(
                          children: [
                            // Address Line 1
                            CommonTextLayout(
                              text: language(context, "Address Line 1"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),
                            TextFieldCommon(
                              controller: registration.addLine1Controller,
                              keyboardType: TextInputType.text,
                              focusNode: registration.addLine1Focus,
                              hintText:
                                  language(context, "Enter your address line 1"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  registration.addLine1Focus.requestFocus();
                                  Vibration.vibrate();
                                  return "Address line 1 is required";
                                }
                                return null;
                              },
                            ),
                            const VSpace(Sizes.s15),
                            // Address Line 2
                            CommonTextLayout(
                              text: language(context, "Address Line 2"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),
                            TextFieldCommon(
                              controller: registration.addLin2Controller,
                              keyboardType: TextInputType.text,
                              focusNode: registration.addLine2Focus,
                              hintText:
                                  language(context, "Enter your address line 2"),
                            ),
                            const VSpace(Sizes.s15),
                            // City
                            CommonTextLayout(
                              text: language(context, "City"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),
                            TextFieldCommon(
                              controller: registration.cityController,
                              keyboardType: TextInputType.text,
                              focusNode: registration.cityFocus,
                              hintText: language(context, "Enter your city"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  registration.cityFocus.requestFocus();
                                  Vibration.vibrate();
                                  return "City is required";
                                }
                                return null;
                              },
                            ),
                            const VSpace(Sizes.s15),
                            // State
                            CommonTextLayout(
                              text: language(context, "State"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),
                            TextFieldCommon(
                              controller: registration.stateController,
                              keyboardType: TextInputType.text,
                              focusNode: registration.stateFocus,
                              hintText: language(context, "Enter your state"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  registration.stateFocus.requestFocus();
                                  Vibration.vibrate();
                                  return "State is required";
                                }
                                return null;
                              },
                            ),
                            const VSpace(Sizes.s15),
                            // Pincode
                            CommonTextLayout(
                              text: language(context, "Pincode"),
                              isStyle: true,
                            ),
                            const VSpace(Sizes.s6),
                            TextFieldCommon(
                              controller: registration.pincodeController,
                              keyboardType: TextInputType.number,
                              focusNode: registration.pincodeFocus,
                              hintText: language(context, "Enter your Pincode"),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  registration.pincodeFocus.requestFocus();
                                  Vibration.vibrate();
                                  return "Pincode is required";
                                } else if (value.length != 6) {
                                  return "Pincode must be 6 digits long";
                                }
                                return null;
                              },
                            ),
                            VSpace(Sizes.s15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_pageController.page! > 0) {
                                          _pageController.previousPage(
                                              duration: Duration(milliseconds: 300),
                                              curve: Curves.easeInOut);
                                        }
                                      },
                                      child: Text("Previous"),
                                    ),
                                  ],
                                ),
                                VSpace(Sizes.s18),

                                ButtonCommon(
                                  title: language(context, appFonts.signUp),
                                  onTap: () async {
                                    if (registrationKey3.currentState!
                                        .validate()) {
                                      // Show loading dialog
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            content: Center(
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<Color>(
                                                        Colors.blue),
                                              ),
                                            ),
                                          );
                                        },
                                      );


                                      final taskData = {
                                        "email":
                                            registration.emailController.text,
                                        "password":
                                            registration.passwordController.text,
                                        "name":
                                            "${registration.firstNameController.text} ${registration.lastNameController.text}",
                                        "dob": registration.dobController.text,
                                        "gender": registration.gender,
                                        "role": "parent",
                                        "phoneNumber": registration
                                            .phoneNumberController.text,
                                        "address1":
                                            registration.addLine1Controller.text,
                                        "address2":
                                            registration.addLin2Controller.text,
                                        "address3":
                                            registration.addLin2Controller.text,
                                        "city": registration.cityController.text,
                                        "state":
                                            registration.stateController.text,
                                        "pinCode":
                                            registration.pincodeController.text,
                                        "firstName":
                                            registration.firstNameController.text,
                                        "lastName":
                                            registration.lastNameController.text,
                                      };

                                      try {
                                        // Make the API call
                                        await sign_up_method(taskData);

                                        // Close the loading dialog
                                        Navigator.of(context).pop();

                                        // Handle success or failure
                                        if (sign_up_success == true) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EmailSentScreen(),
                                            ),
                                          );
                                        } else {
                                          Fluttertoast.showToast(
                                            msg: "Sign Up Failed",
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                          );
                                        }
                                      } catch (error) {
                                        // Close the loading dialog
                                        Navigator.of(context).pop();

                                        // Show error message
                                        Fluttertoast.showToast(
                                          msg:
                                              "An error occurred. Please try again.",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                        );
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "Please fill the required fields",
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                      );
                                    }
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Buttons to navigate between pages
              ],
            ),
          ),
          // Column(
          //   children: [
          //     //text layout
          //     CommonTextLayout(
          //         text: language(context, "First Name"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       focusNode: registration.firstNameFocus,
          //       controller: registration.firstNameController,
          //       keyboardType: TextInputType.text,
          //       hintText: language(context, "Enter your first name"),
          //       inputFormatters: [
          //         FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
          //         // Allow only letters, no numbers or symbols
          //       ],
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           registration.firstNameFocus.requestFocus();
          //           Vibration.vibrate();
          //           return "First name is required";
          //         } else if (value.trim().isEmpty) {
          //           return "First name cannot be empty or just spaces";
          //         }
          //         return null;
          //       },
          //     ),
          //
          //     const VSpace(Sizes.s15),
          //     //text layout
          //     CommonTextLayout(
          //         text: language(context, "Last Name"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       keyboardType: TextInputType.text,
          //       focusNode: registration.lastNameFocus,
          //       controller: registration.lastNameController,
          //       hintText: language(context, "Enter your last name"),
          //       inputFormatters: [
          //         FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
          //         // Allow only letters, no numbers or symbols
          //       ],
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           registration.lastNameFocus.requestFocus();
          //           Vibration.vibrate();
          //           return "Last name is required";
          //         } else if (value.trim().isEmpty) {
          //           return "Last name cannot be empty or just spaces";
          //         }
          //         return null;
          //       },
          //     ),
          //     const VSpace(Sizes.s15),
          //     //text layout
          //     CommonTextLayout(
          //         text: language(context, "Phone Number"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       controller: registration.phoneNumberController,
          //       keyboardType: TextInputType.number,
          //       focusNode: registration.phoneNumberFocus,
          //       hintText: language(context, "Enter your phone number"),
          //       inputFormatters: [
          //         FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          //         LengthLimitingTextInputFormatter(10)
          //         // Allow only numbers
          //       ],
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           registration.lastNameFocus.requestFocus();
          //           Vibration.vibrate();
          //           return "Phone number is required";
          //         } else if (value.trim().isEmpty) {
          //           return "Phone number cannot be empty or just spaces";
          //         } else if (value.length != 10) {
          //           return "Phone number must be exactly 10 digits";
          //         }
          //         return null;
          //       },
          //     ),
          //
          //     const VSpace(Sizes.s15),
          //
          //     CommonTextLayout(
          //       text: language(context, "Date of Birth"),
          //       isStyle: true,
          //     ),
          //     const VSpace(Sizes.s6),
          //
          //     TextFieldCommon(
          //       controller: registration.dobController,
          //       keyboardType: TextInputType.text,
          //       focusNode: registration.dobFocus,
          //       hintText: language(context, "Select your Date of Birth"),
          //       readOnly: true,
          //       // Makes the field non-editable
          //       onTap: () async {
          //         DateTime? pickedDate = await showDatePicker(
          //           context: context,
          //           initialDate: DateTime.now(),
          //           firstDate: DateTime(1900),
          //           lastDate: DateTime.now(),
          //           builder: (BuildContext context, Widget? child) {
          //             return Theme(
          //               data: Theme.of(context).copyWith(
          //                 colorScheme: ColorScheme.light(
          //                   primary: Theme.of(context).primaryColor,
          //                   onPrimary: Colors.white,
          //                   onSurface: Colors.black,
          //                 ),
          //               ),
          //               child: child!,
          //             );
          //           },
          //         );
          //         if (pickedDate != null) {
          //           String formattedDate =
          //               "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
          //           registration.dobController.text = formattedDate;
          //         }
          //
          //         if (_isUserUnderage(pickedDate!)) {
          //           ScaffoldMessenger.of(context).showSnackBar(
          //             SnackBar(
          //               content: Text(
          //                 "You must be 18 years or older to register.",
          //                 style: TextStyle(color: Colors.white), // Text color
          //               ),
          //               backgroundColor: Colors.red, // Background color
          //               duration: Duration(seconds: 3),
          //             ),
          //           );
          //         }
          //       },
          //     ),
          //
          //     const VSpace(Sizes.s15),
          //
          //     Row(
          //       // mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           'Gender:',
          //           style: TextStyle(
          //             fontSize: 16,
          //             color: Colors.white,
          //           ),
          //         ),
          //         SizedBox(width: 10),
          //         ChoiceChip(
          //           label: Text('Male'),
          //           selected: registration.gender == 'Male',
          //           // Check if 'Male' is selected
          //           onSelected: (selected) {
          //             setState(() {
          //               registration.gender =
          //                   'Male'; // Set selected gender to 'Male'
          //             });
          //           },
          //           selectedColor: Colors.yellow,
          //         ),
          //         SizedBox(width: 10),
          //         ChoiceChip(
          //           label: Text('Female'),
          //           selected: registration.gender == 'Female',
          //           // Check if 'Female' is selected
          //           onSelected: (selected) {
          //             setState(() {
          //               registration.gender =
          //                   'Female'; // Set selected gender to 'Female'
          //             });
          //           },
          //           selectedColor: Colors.yellow,
          //         ),
          //       ],
          //     ),
          //
          //     const VSpace(Sizes.s15),
          //
          //     CommonTextLayout(text: language(context, "Email"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       controller: registration.emailController,
          //       keyboardType: TextInputType.emailAddress,
          //       focusNode: registration.emailFocus,
          //       hintText: language(context, "Enter your email address"),
          //       inputFormatters: [
          //         FilteringTextInputFormatter.deny(RegExp(r'\s')),
          //         // Allow only numbers
          //       ],
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           registration.emailFocus.requestFocus();
          //           Vibration.vibrate();
          //           return "Email address is required";
          //         }
          //
          //         RegExp emailRegExp = RegExp(
          //           r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
          //         );
          //         if (!emailRegExp.hasMatch(value)) {
          //           registration.emailFocus.requestFocus();
          //           Vibration.vibrate();
          //           return "Please enter a valid email address";
          //         }
          //
          //         return null;
          //       },
          //     ),
          //     const VSpace(Sizes.s15),
          //
          //     CommonTextLayout(
          //         text: language(context, "Password"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       controller: registration.passwordController,
          //       keyboardType: TextInputType.visiblePassword,
          //       focusNode: registration.passwordFocus,
          //       hintText: language(context, "Enter your password"),
          //       obscureText: true,
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           registration.passwordFocus.requestFocus();
          //           Vibration.vibrate();
          //           return "Password is required";
          //         } else if (value.length < 8) {
          //           return "Password must be at least 8 characters";
          //         } else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
          //           return "Password must contain at least one lowercase letter";
          //         } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
          //           return "Password must contain at least one uppercase letter";
          //         } else if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
          //           return "Password must contain at least one number";
          //         } else if (!RegExp(
          //                 r'(?=.*[!@#\$%\^&\*\(\)_\+\-=\[\]\{\};:,.<>?\\|])')
          //             .hasMatch(value)) {
          //           return "Password must contain at least one special character";
          //         }
          //         return null; // No errors, password is valid
          //       },
          //     ),
          //     const VSpace(Sizes.s15),
          //
          //     CommonTextLayout(
          //         text: language(context, "Confirm Password"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       controller: registration.confPassController,
          //       keyboardType: TextInputType.visiblePassword,
          //       focusNode: registration.confPassFocus,
          //       hintText: language(context, "Enter confirm password"),
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           registration.confPassFocus.requestFocus();
          //           Vibration.vibrate();
          //           return "Confirm password is required";
          //         } else if (value != registration.passwordController.text) {
          //           return "Passwords do not match";
          //         }
          //         return null; // No errors, confirm password is valid
          //       },
          //     ),
          //     const VSpace(Sizes.s15),
          //
          //     CommonTextLayout(
          //         text: language(context, "Address Line 1"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       controller: registration.addLine1Controller,
          //       keyboardType: TextInputType.text,
          //       focusNode: registration.addLine1Focus,
          //       hintText: language(context, "Enter your address line 1"),
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           registration.addLine1Focus.requestFocus();
          //           Vibration.vibrate();
          //           return "Address line 1 is required";
          //         }
          //         return null; // No errors, confirm password is valid
          //       },
          //     ),
          //     const VSpace(Sizes.s15),
          //
          //     CommonTextLayout(
          //         text: language(context, "Address Line 2"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       controller: registration.addLin2Controller,
          //       keyboardType: TextInputType.text,
          //       focusNode: registration.addLine2Focus,
          //       hintText: language(context, "Enter your address line 2"),
          //
          //       /*validator: (value) => validation.passValidation(context, value)*/
          //     ),
          //     const VSpace(Sizes.s15),
          //
          //     CommonTextLayout(text: language(context, "City"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       controller: registration.cityController,
          //       keyboardType: TextInputType.text,
          //       focusNode: registration.cityFocus,
          //       hintText: language(context, "Enter your city"),
          //
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           registration.cityFocus.requestFocus();
          //           Vibration.vibrate();
          //           return "City is required";
          //         }
          //         return null;
          //       },
          //     ),
          //     const VSpace(Sizes.s15),
          //
          //     CommonTextLayout(text: language(context, "State"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       controller: registration.stateController,
          //       keyboardType: TextInputType.text,
          //       focusNode: registration.stateFocus,
          //       hintText: language(context, "Enter your state"),
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           registration.stateFocus.requestFocus();
          //           Vibration.vibrate();
          //           return "State is required";
          //         }
          //         return null;
          //       },
          //     ),
          //     const VSpace(Sizes.s15),
          //     CommonTextLayout(
          //         text: language(context, "Pincode"), isStyle: true),
          //     const VSpace(Sizes.s6),
          //     //text filed
          //     TextFieldCommon(
          //       controller: registration.pincodeController,
          //       keyboardType: TextInputType.number,
          //       focusNode: registration.pincodeFocus,
          //       hintText: language(context, "Enter your Pincode"),
          //       inputFormatters: [
          //         FilteringTextInputFormatter.digitsOnly,
          //         LengthLimitingTextInputFormatter(6)
          //         // Allow only numbers
          //       ],
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           registration.pincodeFocus.requestFocus();
          //           Vibration.vibrate();
          //           return "Pincode is required";
          //         } else if (value.length != 6) {
          //           return "Pincode must be 6 digits long"; // Length validation for 6 digits
          //         } else if (!RegExp(r'^\d{6}$').hasMatch(value)) {
          //           return "Pincode must contain only digits"; // Ensure only digits
          //         }
          //         return null; // No errors, pincode is valid
          //       },
          //     ),
          //   ],
          // ),
        ],
      );
    });
  }

  bool _isUserUnderage(DateTime dob) {
    final today = DateTime.now();
    final age = today.year - dob.year;
    final isBeforeBirthdayThisYear = (today.month < dob.month) ||
        (today.month == dob.month && today.day < dob.day);
    return age < 18 || (age == 18 && isBeforeBirthdayThisYear);
  }

  List<String> validationMessages = [];

  bool validatePassword(String value) {
    List<String> errors = [];
    if (value.isEmpty) {
      errors.add("Password is required.");
    } else {
      if (value.length < 8) {
        errors.add("Password must be at least 8 characters.");
      }
      if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
        errors.add("Password must contain at least one lowercase letter.");
      }
      if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
        errors.add("Password must contain at least one uppercase letter.");
      }
      if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
        errors.add("Password must contain at least one number.");
      }
      if (!RegExp(
          r'(?=.*[!@#\$%\^&\*\(\)_\+\-=\[\]\{\};:,.<>?\\|])')
          .hasMatch(value)) {
        errors.add("Password must contain at least one special character.");
      }
    }
    setState(() {
      validationMessages = errors;
    });
    return errors.isEmpty;
  }

}
